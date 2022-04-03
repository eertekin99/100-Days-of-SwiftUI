import Cocoa

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print("toggled:",gameOver)
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

let firstPart = "Hello, "
let secondPart = "world!"
let hi = firstPart + secondPart

let name = "Efe"
let age = 23
let message = "Hello, my name is \(name). I am \(age) years old."
print(message)

print("5 x 5 = \(5*5)")

//Checkpoint1
let Celsius = 12.0
let Fahrenheit = (Celsius*9/5)+32
let degrees = "Celsius = \(Celsius)°C; Fahrenheit = \(Fahrenheit)°F"
print(degrees)
