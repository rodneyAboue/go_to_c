package main

import "fmt"

func main() {
	c0 := make(chan int)
	c1 := make(chan int)
	
	go source(c0)
	go seuillage(c0, c1, 127)
	go affichage(c1)
	
	select{} //methode conseillee pour bloquer un main
}

func source(out chan int) {
	for {
		out <- 150
	}
}

func seuillage(in chan int, out chan int, seuil int) {
	var pixelIn, pixelOut int
	for {
		pixelIn = <-in
		out <- pixelOut
	}
}

func affichage(in chan int) {
	var res int
	for {
		res = <-in
		fmt.Println(res)
	}
}







