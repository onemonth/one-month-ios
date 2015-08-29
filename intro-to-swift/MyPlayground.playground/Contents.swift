//: Playground - noun: a place where people can play

import UIKit

var myString = "Hello, playground"
myString = "some new string"

var myOtherString: String
myOtherString = "something cool"

var myInt = 1000
myInt = myInt * 5

var myOtherInt: Int
myOtherInt = 999

var myFloat = 0.5
var myOtherFloat = 0.9999
myOtherFloat = 1.02

var myArray = ["something"]

var myOtherArray: Array<String>
myOtherArray = ["zero"]
myOtherArray.append("one")
myOtherArray.append("two")

var myDictionary = ["key" : "value"]

var myOtherDictionary: Dictionary<String, String>
myOtherDictionary = ["one" : "value1"]
myOtherDictionary["two"] = "value2"

myOtherDictionary

let myNewString = "test value"

let bob: String

bob = "some value"

let myConstantArray = ["alfie"]


var myOptionalString: String? = "alfie"

myOptionalString = "scrumptious"

myOptionalString = nil

if let myConstantString = myOptionalString
{
    print("the value is not nil")
}
else
{
    print("nil!")
}

var myOptionalArray: Array<String>? = ["scrumptious"]

myOptionalArray = nil

myOptionalArray?.append("alfie")

myOptionalArray

