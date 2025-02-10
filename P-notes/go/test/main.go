package main

import (
	"fmt"
	"strings"
)

func main() {

	fmt.Println("Hello World!")

	myList := CleanInputs("Hello World!")

	fmt.Println(myList[0])

}

func CleanInputs(text string) []string {
	strList := make([]string, 0)
	strList = strings.Split(text, " ")
	return strList
}
