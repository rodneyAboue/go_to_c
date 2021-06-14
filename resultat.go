package main

import "fmt"

const ordre int = 5
const nbX int = 1000

func main() {
    c0 := make(chan int)
    c1 := make(chan int)
    c2 := make(chan int)
    c3 := make(chan int)
    c4 := make(chan int)
    c5 := make(chan int)

    go source(c0)//sortie 
    
    go traitement(c0, c1, 1)
    go traitement(c1, c2, 2)
    go traitement(c2, c3, 3)
    go traitement(c3, c4, 4)
    go traitement(c4, c5, 5)
    
    go affichage(c5)
    
    select{} 
}

func source(out chan int) {
    for{
     
    }
}

func traitement(in chan int, out chan int, k int) {
    var xIn, pIn, sIn, pOut, sOut int
    for {
        xIn = <-in
        pIn = <-in
        sIn = <-in
        out <- xIn
        out <- pOut
        out <- sOut
    }
}

func affichage(in chan int) {
    var sIn int
    var i int=0
    for {
        <-in
        <-in
        sIn = <-in
    }
}
