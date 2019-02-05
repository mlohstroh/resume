package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	fs := http.FileServer(http.Dir("public"))

	port := "3000"
	if len(os.Getenv("PORT")) > 0 {
		port = os.Getenv("PORT")
	}

	addr := fmt.Sprintf(":%v", port)

	print("Static Server Listening at ", addr)
	http.ListenAndServe(addr, fs)
}
