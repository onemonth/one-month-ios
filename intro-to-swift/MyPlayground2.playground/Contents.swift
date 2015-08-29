//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func myFunction(name: String)
{
    print("Hi \(name)!")
}

myFunction("Alfie")


for index in 1...5
{
    print("Number: \(index)")
}

func myNewFunction(name: String)
{
    for _ in 1...5
    {
        print("Hi: \(name)")
    }
}

myNewFunction("Alfie")


let names = ["Alfie", "Scrumptious", "Chris", "Lee"]

for name in names
{
    print("Hi \(name)")
}
