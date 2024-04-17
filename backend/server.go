package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

func main() {
	http.HandleFunc("GET /api/v1/health", func(w http.ResponseWriter, r *http.Request) {
		// response hostname and time
		hostname, _ := os.Hostname()
		fmt.Fprintf(w, "Hostname: %s\nTime: %s\n", hostname, time.Now().Format(time.RFC3339))
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server listening on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
