import Cocoa


var characters = ["Lana", "Del", "Rey"]
print(characters.count)
// eğer arrayin dolacağı kesinse keeping capacity true yap
// böylece swift array size genişletmeyle uğraşmayacak
characters.removeAll(keepingCapacity: true)


//Default parameter
func roll(number: Int = 10) -> Int {
    return Int.random(in: 1...number)
}

let newNum = roll()
print(newNum)

let newNum2 = roll(number: 50)
print(newNum2)


//ERROR HANDLING EXAMPLES

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "125"

do{
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short{
    print("Password is too short.")
} catch PasswordError.obvious{
    print("Too obvious password.")
} catch {
    print("There was an error. \(error.localizedDescription)")
}


//Checkpoint 4
//The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
/**
You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
If you can’t find the square root, throw a “no root” error.
*/

enum errors: Error {
    case outOfBounds, noRoot
}

func findSquareRoot(of number: Int) throws -> Int {
    
    //handling error
    if number < 1 || number > 10_000 {
        throw errors.outOfBounds
    }
    
    for i in 1...100 {
        if number == (i*i){
            return i
        }
    }
    throw errors.noRoot
}

let number = 169

do{
    let sonuç = try findSquareRoot(of: number)
    print("The squared root of the \(number) is \(sonuç)")
} catch errors.noRoot{
    print("Specified number has no root")
} catch errors.outOfBounds {
    print("Desired range is between 1-10000")
}
