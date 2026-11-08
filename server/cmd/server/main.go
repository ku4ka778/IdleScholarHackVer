package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"os"

	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/grpc"

	authpb "IdleScholar_BD/gen/auth"
	characterpb "IdleScholar_BD/gen/character"
	citypb "IdleScholar_BD/gen/city"
	craftpb "IdleScholar_BD/gen/craft"
	equipmentpb "IdleScholar_BD/gen/equipment"
	expeditionpb "IdleScholar_BD/gen/expedition"

	authserver "IdleScholar_BD/internal/auth"
	characterserver "IdleScholar_BD/internal/character"
	cityserver "IdleScholar_BD/internal/city"
	craftserver "IdleScholar_BD/internal/craft"
	equipmentserver "IdleScholar_BD/internal/equipment"
	expeditionserver "IdleScholar_BD/internal/expedition"
	httpapi "IdleScholar_BD/internal/httpapi"
)

func main() {
	ctx := context.Background()

	// Docker
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")
	dbUser := os.Getenv("DB_USER")
	dbPass := os.Getenv("DB_PASSWORD")
	dbName := os.Getenv("DB_NAME")

	if dbHost == "" {
		dbHost = "95.31.41.147"
	}
	if dbPort == "" {
		dbPort = "65432"
	}
	if dbUser == "" {
		dbUser = "postgres"
	}
	if dbPass == "" {
		dbPass = `U29%/W@M%pF5eqv9.t\vr6L>dIY^:b`
	}
	if dbName == "" {
		dbName = "idlescholar"
	}

	connStr := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable",
		dbUser, dbPass, dbHost, dbPort, dbName)

	config, err := pgxpool.ParseConfig(connStr)
	if err != nil {
		log.Fatalf("Unable to parse DB config: %v\n", err)
	}
	
	dbPool, err := pgxpool.NewWithConfig(ctx, config)
	if err != nil {
		log.Fatalf("Unable to connect to database: %v\n", err)
	}
	defer dbPool.Close()

	if err := dbPool.Ping(ctx); err != nil {
		log.Fatalf("Database ping failed: %v\n", err)
	}
	fmt.Println("Successfully connected to PostgreSQL!")

	// HTTP server
	go func() {
		httpServer := httpapi.NewHTTPServer(dbPool)
		if err := httpServer.Start("0.0.0.0:8080"); err != nil {
			log.Fatalf("HTTP server failed: %v", err)
		}
	}()

	listener, err := net.Listen("tcp", "0.0.0.0:50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v\n", err)
	}

	// gRPC
	grpcServer := grpc.NewServer()
	
	authpb.RegisterAuthServiceServer(grpcServer, authserver.NewServer(dbPool))
	characterpb.RegisterCharacterServiceServer(grpcServer, characterserver.NewServer(dbPool))
	citypb.RegisterCityServiceServer(grpcServer, cityserver.NewServer(dbPool))
	craftpb.RegisterCraftServiceServer(grpcServer, craftserver.NewServer(dbPool))
	equipmentpb.RegisterEquipmentServiceServer(grpcServer, equipmentserver.NewServer(dbPool))
	expeditionpb.RegisterExpeditionServiceServer(grpcServer, expeditionserver.NewServer(dbPool))

	log.Println("gRPC server running on port :50051")
	if err := grpcServer.Serve(listener); err != nil {
		log.Fatalf("Failed to serve gRPC: %v\n", err)
	}
}
