package main

import (
	_ "bufio"
	"fmt"
	"pokedex/main/dogs"
	"strings"
)

func main() {

	fmt.Println("Hello World!")
	myList := CleanInputs("Hello World!")
	fmt.Println(myList[0])
	fmt.Println(speak())
	dogs.Speak()
	fmt.Println(dogs.Test)
}

func CleanInputs(text string) []string {
	strList := make([]string, 0)
	strList = strings.Split(text, " ")
	return strList
}
