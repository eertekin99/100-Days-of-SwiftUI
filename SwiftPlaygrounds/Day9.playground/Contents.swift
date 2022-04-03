import Cocoa

//func greetUser() {
//    print("Hi there!")
//}


//greetUser()
//
//var greetCopy = greetUser
//greetCopy()

/**
let sayHello = {
    print("Hi there again!")
}

sayHello()
*/

//let sayHello = {
//    (name: String) -> String in
//    return "Hi \(name)!"
//}
//
//var text = sayHello("Efe")
//print(text)
//
//
//var greetCopy: () -> Void = greetUser
//
//
//func getUserData(for id: Int) -> String {
//    if id == 1989 {
//        return "Taylor Swift"
//    } else {
//        return "Anonymous"
//    }
//}
//
//let data: (Int) -> String = getUserData
//let user = data(1989)
//print(user)
//
//sayHello("Taylor")
//let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
//let sortedTeam = team.sorted()
//print(sortedTeam)
//
//
//func captainFirstSorted(name1: String, name2: String) -> Bool {
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//    return name1 < name2
//}
//
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})

//let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})
//let captainFirstTeam = team.sorted { name1, name2 in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//}

//let captainFirstTeam = team.sorted {
//    if $0 == "Suzanne" {
//        return true
//    } else if $1 == "Suzanne" {
//        return false
//    }
//
//    return $0 < $1
//}
//
//print(captainFirstTeam)
//
////let reverseTeam = team.sorted {
////    return $0 > $1
////}
//
//let reverseTeam = team.sorted { $0 > $1 }
//
//let tOnly = team.filter { $0.hasPrefix("T") }
//print(tOnly)
//
//let uppercaseTeam = team.map { $0.uppercased() }
//print(uppercaseTeam)


//func greetUser() {
//    print("Hi there!")
//}
//
//greetUser()
//
//var greetCopy: () -> Void = greetUser
//greetCopy()
//
//func makeArray(size: Int, using generator: () -> Int) -> [Int] {
//    var numbers = [Int]()
//
//    for _ in 0..<size {
//        let newNumber = generator()
//        numbers.append(newNumber)
//    }
//
//    return numbers
//}
//
//let rolls = makeArray(size: 50) {
//    Int.random(in: 1...20)
//}
//print(rolls)
//
//
//func generateNumber() -> Int {
//    Int.random(in: 1...20)
//}
//
//let newRolls = makeArray(size: 5, using: generateNumber)
//print(newRolls)
//
//
//func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
//    print("About to start first work")
//    first()
//    print("About to start second work")
//    second()
//    print("About to start third work")
//    third()
//    print("Done!")
//}
//
//doImportantWork {
//    print("This is the first work")
//} second: {
//    print("This is the second work")
//} third: {
//    print("This is the third work")
//}

//let uppercaseTeam = team.map { $0.uppercased() }


//Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
//
//let filteredNums = luckyNumbers.filter { !$0.isMultiple(of: 2) }
//print(filteredNums)
//
//let sortedNums = filteredNums.sorted()
//print(sortedNums)
//
//let mappedNums = sortedNums.map { "\($0) is a lucky number" }
//print(mappedNums)
//
//
//func printing(arrays: [String]) -> Void {
//    for i in 0..<arrays.count {
//        print(arrays[i])
//    }
//}
//
//printing(arrays: mappedNums)


let _ = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }   // filter out even numbers
    .sorted()                           // sort the odd numbers
    .map { print("\($0) is a lucky number.") } // map to strings

var newVar = "string"
do {
    try {
        newVar = 3
    }
    
} catch {
        print("\(newVar)")
    }

