import Cocoa

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

var books: Set<String> = Set(["Hello", "World"])

//empty arrays
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()
//

enum UIStyle {
    case light, dark, system
}
//It knows it is UIStyle
var style = UIStyle.light
style = .dark

//type annotation
let username: String
username = "Name"
print(username)


//Checkpoint 2
var newArray: [String] = ["Efe","Ali","Ayse","Mehmet","Efe"]
print(newArray.count)
//to learn the unique number of items we are gonna use sets
//sets can't have same items in them so it will generate automatically the unique number of items
var newSet: Set<String> = Set(newArray)
print(newSet.count)
