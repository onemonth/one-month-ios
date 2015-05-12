//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func myFunction(name: String)
{
    println("Hi \(name)!")
}

myFunction("Alfie")


for index in 1...5
{
    println("Number: \(index)")
}

func myNewFunction(name: String)
{
    for index in 1...5
    {
        println("Hi: \(name)")
    }
}

myNewFunction("Alfie")


let names = ["Alfie", "Scrumptious", "Chris", "Lee"]

for name in names
{
    println("Hi \(name)")
}