package main

import "fmt"

func main() {
    str := `package main

import "fmt"

func main() {
    str := %c%s%c
    fmt.Printf(str, 96, str, 96)
}
`
    fmt.Printf(str, 96, str, 96)
}

