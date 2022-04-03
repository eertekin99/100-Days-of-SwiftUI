import Cocoa

//class Game {
//    var score = 0 {
//        didSet {
//            print("Score is now \(score)")
//        }
//    }
//}
//
//var newGame = Game()
//newGame.score += 10

//class Employee {
//    let hours: Int
//
//    init (hours: Int) {
//        self.hours = hours
//    }
//
//    func printSummary() {
//        print("I work \(hours) hours a day.")
//    }
//}
//
////final koyarsak bundan inheritance edemez başka classlar.
////son child class için çok uygun.
//final class Developer: Employee {
//    func work() {
//        print("I'm writing code for \(hours) hours.")
//    }
//
//    override func printSummary() {
//        print("I am a developer that work for \(hours) hours.")
//    }
//}
//
//class Manager: Employee {
//    func work() {
//        print("I'm going to meeting for \(hours) hours.")
//    }
//}
//
//
//let robert = Developer(hours: 8)
//let joseph = Manager(hours: 10)
//robert.work()
//joseph.work()
//
//let novall = Developer(hours: 8)
//novall.printSummary()
//
//
//
//
////init yaratma olayları
////özellikle child için önemli bir detay var
//
//class Vehicle {
//    let isElectric: Bool
//
//    init(isElectric: Bool) {
//        self.isElectric = isElectric
//    }
//}
//
//class Car: Vehicle {
//    let isConvertible: Bool
//
//    init(isElectric: Bool, isConvertible: Bool) {
//        self.isConvertible = isConvertible
//        super.init(isElectric: isElectric)
//    }
//}
//
//let teslaX = Car(isElectric: true, isConvertible: false)


//class User {
//    var username = "Anonymous"
//
//    //deep copy muhabbeti
//    func copy() -> User {
//        let user = User()
//        user.username = username
//        return user
//    }
//}
//// Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.
//
//var user1 = User()
//var user2 = user1
//
//user2.username = "Taylor Swift"
//
//print(user1.username)
//print(user2.username)


//class User {
//    let id: Int
//
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive!")
//    }
//
//    deinit {
//        print("User \(id): I'm dead!")
//    }
//}
//var users = [User]()
//
//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control")
//    users.append(user)
//}
//
//print("Loop is finished!")
//users.removeAll()
//print("Array is clear")

//class User {
//    var name = "Paul"
//}
//
////let user = User()
////user.name = "Taylor"
////print(user.name)
//
//var user = User()
//user.name = "Swift"
//user = User()
//print(user.name)

class Animal {
    var legs: Int
    
    init (legs: Int) {
        self.legs = legs
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init (legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Generic Meow: Meoooww!")
    }
}

class Dog: Animal {
    func speak() {
        print("Generic Barking: Whoofff!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle Barking: Vowows!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian Meow: Mioowww!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion Meow: Whrrr!")
    }
}
