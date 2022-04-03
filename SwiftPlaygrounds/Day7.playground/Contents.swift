import Cocoa

func showWelcome() {
    print("Welcome to my app")
    print("Yeni bir seyler deniyoruz")
}

showWelcome()

let troll = Int.random(in: 1...20)

/**
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5)
*/

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

//let result = rollDice()
//print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

areLettersIdentical(string1: "Ali", string2: "ila")

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// Eğer tek satır varsa return yazmana gerek yok ama saçma hareket
// Her zaman return kullan daha temiz ve anlaşılır oluyor bence
func pythagoras1(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
pythagoras1(a: 3, b: 4)

/**
func getUser() -> [String] {
    return ["Taylor", "Swift"]
}
let user = getUser()
print("Name: \(user[0]) \(user[1])")
*/

/**
func getUser() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user = getUser()
print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")
*/

/**
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
*/

/**
func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
*/

/**
func getUser() -> (String, String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name: \(user.0) \(user.1)")
*/

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//print("Name: \(firstName) \(lastName)")

//let (firstName, lastName) = getUser()
//print("Name: \(firstName) \(lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")


func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

//hireEmployee(name: )
//hireEmployee(title: )

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))


func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)


// We write for number: Int: the external name is for, the internal name is number, and it’s of type Int.
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)
