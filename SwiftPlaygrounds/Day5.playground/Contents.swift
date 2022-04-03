import Cocoa

var greeting = "Hello, playground"

if 11 == 10{
    print("Successfull")
}
else if 11 == 11{
    print("Hello")
}
else{
    print("They are not equal")
}

let percentage = 85

if percentage >= 80 {
    print("You have higher score than \(percentage)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"
if country != "Australia"{
    print("G'day!")
}

var username = "taylorswift13"
if username == ""{
    username = "Anonymous"
}
print("Welcome, \(username)!")

if username.count == 0 {
    username = "Anonymous"
}

if username.isEmpty == false {
    username = "Taio Cruz"
}
print(username)

let temp = 25
if temp > 20 {
    if temp < 30 {
        print("It's a nice day!")
    }
}

if temp > 20 && temp < 30 {
    print("Still a nice day :)")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy alcohol")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly goess brrrr")
}
else if transport == .bicycle {
    print("I need a better bicycle lol.")
}
else if transport == .car {
    print("We are gonna stuck in the traffic.")
}
else {
    print("Scooter goes like a wind")
}

/**
var actualWage: Int = 22_000
var medianWage: Double = 22_000
if actualWage >= medianWage {
    print("Success")
}
*/


enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

/**
var day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    day -= 1
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

print(day)
*/

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

//WTF: what? true false
let age = 18
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

//WTF'ti if-else durumu için kullanmak işleri çok kolaylaştırıyor
//Böylece tek satırda bütün dönüşleri sağlamış oluyoruz.

var image = 10
let newImage = image > 5 ? "lol" : "X"
print(newImage)
