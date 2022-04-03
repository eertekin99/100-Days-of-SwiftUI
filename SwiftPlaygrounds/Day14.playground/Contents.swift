import Cocoa

//let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
//let peachOpposite = opposites["Peach"]
//
//if let marioOpposite = opposites["Mario"]  {
//    print("Mario's opposite is \(marioOpposite)")
//}
//
//var username: String? = nil
//
//if let unwrappedName = username {
//    print("We got a user: \(unwrappedName)")
//} else {
//    print("The optional was empty.")
//}
//
//var num1 = 1_000_000
//var num2 = 0
//var num3: Int? = nil
//
//var str1 = "Hello"
//var str2 = ""
//var str3: String? = nil
//
//var arr1 = [0]
//var arr2 = [Int]()
//var arr3: [Int]? = nil //doesnt exist
//
//func square(number: Int) -> Int {
//    number * number
//}
//
//var number: Int? = nil
//
//if let unwrappedNumber = number {
//    print(square(number: unwrappedNumber))
//}


//func greatest(list: [Int]) -> Int? {
//    if list.count == 0 {
//        return nil
//    }
//
//    var greatestNum = list[0]
//    for num in list {
//        if greatestNum < num {
//            greatestNum = num
//        }
//
//    }
//
//    return greatestNum
//}
//
//greatest(list: [10,2,3,4,5])


//func printSquare(of number: Int?) {
//    guard let number = number else {
//        print("Missing input")
//        return
//    }
//
//    print("\(number) x \(number) is \(number * number)")
//}
//
//var myVar: Int? = 3
//
////if let unwrapped = myVar {
////    //Run if myVar has a value inside
////}
//
//guard let unwrapped = myVar else {
//    //Run if myVar doesn't have a value inside
//    print("FAIL")
//    throw NSError() //func içibdeyse düz return yoksa error throwlaman lazım
//}

//let captains = [
//    "Enterprise": "Picard",
//    "Voyager": "Janeway",
//    "Defiant": "Sisko"
//]
//
////let new = captains["Serenity", default: "N/A"]
//let new = captains["Serenity"] ?? "N/A"
//
//let tvShows = [ "Archer", "Babylon 5", "Ted Lasso"]
//let favourite = tvShows.randomElement() ?? "None"
//
//struct Book {
//    let title: String
//    let author: String?
//}
//
//let book = Book(title: "Beowulf", author: nil)
//let author = book.author ?? "Anonymous"
//print(author)
//
//let input = ""
//let number = Int(input) ?? 0
//print(number)
//
//
//let names = ["Arya", "Bran", "Robb", "Sansa"]
//// aradaki ? nin anlamı şu eğer içinde value varsa
//// unwrap et sonra .... diye devam
//let chosen = names.randomElement()?.uppercased() ?? "No one"
//print("Next in line: \(chosen)")

//struct Book {
//    let title: String
//    let author: String?
//}
//
//var book: Book? = nil
//let author = book?.author?.first?.uppercased() ?? "A"
//print(author)

//// how to handle function failure with optionals
//enum UserError: Error {
//    case badID, networkFailed
//}
//
//func getUser(id: Int) throws -> String {
//    throw UserError.networkFailed
//}
//
//if let user = try? getUser(id: 23) {
//    print("User: \(user)")
//}
//
//let user = (try? getUser(id: 23)) ?? "Anonymous"


//Checkpoint 9
func oneLine(array: [Int]?) -> Int { array?.randomElement() ?? (Int.random(in: 1...100)) }

oneLine(array: nil)


let units = ["meters", "kilometers", "feet", "yards", "miles"]
let chose = "feet"

units.firstIndex(of: chose)
