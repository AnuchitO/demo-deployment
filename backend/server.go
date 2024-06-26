package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"runtime"
	"time"
)

func text() string {
	hostname, _ := os.Hostname()
	return fmt.Sprintf("Hostname: %s\nTime: %s\n", hostname, time.Now().Format(time.RFC3339))
}

func main() {
	// get current architure of the system
	arch := runtime.GOARCH
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		hostname, _ := os.Hostname()
		log.Printf("request from %s", r.RemoteAddr)
		fmt.Fprintf(w, "Hostname: %s\nTime: %s\nArch: %s\n", hostname, time.Now().Format(time.RFC3339), arch)
	})

	http.HandleFunc("GET /api/v1/health", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		hostname, _ := os.Hostname()
		log.Printf("request from %s", r.RemoteAddr)
		fmt.Fprintf(w, "Hostname: %s\nTime: %s\nArch: %s\n", hostname, time.Now().Format(time.RFC3339), arch)
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("Server listening on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
