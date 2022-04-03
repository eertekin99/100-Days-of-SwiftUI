import Cocoa

var greeting = "Hello, playground"
var name = "Ted"
name = "Efe"
let character = "NeverChange"
//You can't change let

var playerName = "Roy"
print(playerName)

playerName = "Tommy"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

let quote = "Backslash muhabbeti için işte \"Tırnak arasındayım\""

let movie = """
istediğin gibi
space bırakark
yazabilirsin
ama mantıklı string değil
"""

print(movie.count)

print(managerName.uppercased())

print(movie.hasPrefix("istediğin"))
print(meaningOfLife.hasSuffix("down?"))

let score = 11
let reallyBig = 100_000_000 //bu şekil yazabilirsin underscore u ciddiye almıyo swift

let lowestScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

//let number = 120
//print(number.isMultiple(of: 3))
//print(120.isMultiple(of: 3))

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var name1 = "Nicolas Cage"
name1 = "John Travolta"

var rating = 5.0
rating *= 2
rating /= 3
