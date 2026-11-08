package auth

import (
	"context"
	"log"
	"strings"

	"github.com/jackc/pgx/v5/pgxpool"
	"golang.org/x/crypto/bcrypt"
	authpb "IdleScholar_BD/gen/auth"
)

type Server struct {
	authpb.UnimplementedAuthServiceServer
	db *pgxpool.Pool
}

func NewServer(db *pgxpool.Pool) *Server {
	return &Server{db: db}
}

func (s *Server) Register(ctx context.Context, req *authpb.RegisterRequest) (*authpb.AuthResponse, error) {
	username := strings.TrimSpace(req.Username)
	password := req.Password
	email := strings.TrimSpace(req.Email)

	if username == "" || password == "" || email == "" {
		return &authpb.AuthResponse{Success: false, Message: "All fields are required"}, nil
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return &authpb.AuthResponse{Success: false, Message: "Hash error"}, nil
	}

	var accountID int32
	err = s.db.QueryRow(ctx,
		`INSERT INTO account (username, password_hash, email) VALUES ($1, $2, $3) RETURNING id`,
		username, string(hash), email,
	).Scan(&accountID)

	if err != nil {
		if strings.Contains(err.Error(), "account_username_key") {
			return &authpb.AuthResponse{Success: false, Message: "Username already used"}, nil
		}
		log.Printf("Register account error: %v", err)
		return &authpb.AuthResponse{Success: false, Message: "Register error"}, nil
	}

	return &authpb.AuthResponse{Success: true, Message: "OK", AccountId: accountID, Username: username}, nil
}

func (s *Server) Login(ctx context.Context, req *authpb.LoginRequest) (*authpb.AuthResponse, error) {
	username := strings.TrimSpace(req.Username)
	password := req.Password

	if username == "" || password == "" {
		return &authpb.AuthResponse{Success: false, Message: "Enter login and password"}, nil
	}

	var accountID int32
	var hash string
	err := s.db.QueryRow(ctx,
		`SELECT id, password_hash FROM account WHERE username = $1`, username,
	).Scan(&accountID, &hash)

	if err != nil {
		return &authpb.AuthResponse{Success: false, Message: "Invalid login or password"}, nil
	}

	if err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password)); err != nil {
		return &authpb.AuthResponse{Success: false, Message: "Invalid login or password"}, nil
	}

	var charID int32
	var charName string
	err = s.db.QueryRow(ctx,
		`SELECT id, name FROM "character" WHERE account_id = $1 LIMIT 1`, accountID,
	).Scan(&charID, &charName)

	if err != nil {
		return &authpb.AuthResponse{
			Success:     true, 
			Message:     "No character", 
			AccountId:   accountID, 
			Username:    username,
		}, nil
	}

	return &authpb.AuthResponse{
		Success:       true,
		Message:       "OK",
		AccountId:     accountID,
		CharacterId:   charID,
		Username:      username,
		CharacterName: charName,
	}, nil
}

func (s *Server) CreateCharacter(ctx context.Context, req *authpb.CreateCharacterRequest) (*authpb.AuthResponse, error) {
	if req.AccountId == 0 || req.CharacterName == "" {
		return &authpb.AuthResponse{Success: false, Message: "Invalid request"}, nil
	}

	str, dex, intel, luck := int32(2), int32(2), int32(2), int32(2)
	switch req.ClassType {
	case "warrior":
		str, dex, intel, luck = 4, 3, 1, 2
	case "mage":
		str, dex, intel, luck = 1, 3, 4, 2
	case "bard":
		str, dex, intel, luck = 2, 4, 3, 1
	case "alchemist":
		str, dex, intel, luck = 2, 1, 3, 4
	}

	tx, err := s.db.Begin(ctx)
	if err != nil {
		return &authpb.AuthResponse{Success: false, Message: "DB error"}, nil
	}
	defer tx.Rollback(ctx)

	var charID int32
	err = tx.QueryRow(ctx,
		`INSERT INTO "character" (name, account_id, class_type, strength, dexterity, intelligence, luck) 
		 VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id`,
		req.CharacterName, req.AccountId, req.ClassType, str, dex, intel, luck,
	).Scan(&charID)
	
	if err != nil {
		log.Printf("CreateCharacter DB error: %v", err)
		return &authpb.AuthResponse{Success: false, Message: "Failed to create character"}, nil
	}

	_, err = tx.Exec(ctx, `INSERT INTO city (character_id) VALUES ($1)`, charID)
	if err != nil {
		log.Printf("CreateCity DB error: %v", err)
		return &authpb.AuthResponse{Success: false, Message: "Failed to create city"}, nil
	}

	if err := tx.Commit(ctx); err != nil {
		return &authpb.AuthResponse{Success: false, Message: "Commit failed"}, nil
	}

	log.Printf("Character %s created for account %d", req.CharacterName, req.AccountId)

	return &authpb.AuthResponse{
		Success:       true, 
		Message:       "OK", 
		CharacterId:   charID, 
		CharacterName: req.CharacterName,
	}, nil
}
