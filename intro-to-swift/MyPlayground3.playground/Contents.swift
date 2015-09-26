//: Playground - noun: a place where people can play

import UIKit

class Person
{
    let name: String
    let age: Int
    
    init()
    {
        self.name = "Alfie"
        self.age = 35
    }
    
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
    
    func sayHi(friendName: String)
    {
        print("Hi \(friendName)!")
    }
}

var alfie = Person()

var chris = Person(name: "Chris", age: 762)

alfie.sayHi(chris.name)

chris.sayHi(alfie.name)
