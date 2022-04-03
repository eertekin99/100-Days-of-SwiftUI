import Cocoa


protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    
}

struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 4
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 100, using: bike)


func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)


//opaque returnss....
// farklı şekilleri some view diye çağırırsak
// değişiklik yaptığımzıda patlamaz içindeki returnü
protocol View { }

func getRandomNumber() -> some Equatable {
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


//extensions...
var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

// global function yazmak yerine bu şekil yazmak
// daha clean bir code için uygun
// internal access..
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let newTrim = quote.trimmed()
print(newTrim)

print(quote.trim())
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int){
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
// kendi initini extension içinde yaparsan
// memberwise default init de çalışır (swiftin kendi defaultu)
let lotr = Book(title: "LOTR", pageCount: 1178, readingHours: 24)


//extension Double {
//    var isNegative: Bool {
//        return self < 0
//    }
//}
//
//var num = -12.3
//num.isNegative

// sets array dictionaries... = collection
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Swift")
taylor.sayHello()


//Checkpoint 8
protocol Building {
    var rooms: Int { get set }
    var costs: Int { get set }
    var estateAgent: String { get set }
    
    func salesSum()
}

struct House: Building {
    var rooms: Int
    var costs: Int
    var estateAgent: String
    
    func salesSum() {
        print("House === Rooms: \(rooms), Cost: $\(costs), estateAgent: \(estateAgent)")
    }
}

struct Office: Building {
    var rooms: Int
    var costs: Int
    var estateAgent: String
    
    func salesSum() {
        print("Office === Rooms: \(rooms), Cost: $\(costs), estateAgent: \(estateAgent)")
    }
}
