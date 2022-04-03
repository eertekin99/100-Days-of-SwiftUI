import Cocoa

//access control private funds olduğu için struct dışında
//ulaşmak imkansız oluyor. yani struct içindeki fonksiyonlar
//dışında değiştirmek mümkün değil dışarıdan.

//private : struct dışında kimse değemez
//fileprivate: bu dosyadakiler dışında kimse değemez
//public: herkes kullanabilir
//private(set): herkes okuyabilir ama sadece struct içi değiştirebilir

//birden fazla private yaratırsan muhtemelen kendi init ini yazman gerekecek.
//struct BankAccount {
//    private(set) var funds = 0
//
//    init (funds: Int) {
//        self.funds = funds
//        print("The total funs is \(funds)")
//    }
//
//    mutating func deposit(amount: Int) {
//        funds += amount
//    }
//
//    mutating func withdraw(amount: Int) -> Bool {
//        if funds > amount {
//            funds -= amount
//            return true
//        } else {
//            return false
//        }
//    }
//}
//
//var account = BankAccount(funds: 1000)
//account.deposit(amount: 500)
//let success = account.withdraw(amount: 200)
//
//if success {
//    print("Withdrew money successfully")
//} else {
//    print("Failed to get the money")
//}
//
//print(account.funds)


struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static var homeURL = "https://google.com"
    
    static func changeHome(name: String) {
        AppData.homeURL = name
    }
}

AppData.version
print(AppData.version)
AppData.changeHome(name: "facebook.com")
AppData.homeURL
print(AppData.homeURL)

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "efe", password: "123")
}

print(Employee.example)



//Checkpoint 6

struct Car {
    var model = "Fiesta"
    var numberOfSeats = 5
    private var currentGear = "UP" {
        didSet {
            print("Last gear was \(oldValue), but now it is \(currentGear)")
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    mutating func changeGear() {
        if currentGear == "UP" {
            currentGear = "DOWN"
        } else {
            currentGear = "UP"
        }
    }
    
    mutating func addBaby() {
        if numberOfSeats > 0 {
            numberOfSeats -= 1
            print("Baby seat is inserted.")
            print("Available seats: \(numberOfSeats)")
        }
    }
}


var honda = Car(model: "Jazz", numberOfSeats: 6)
honda.addBaby()
honda.addBaby()

honda.changeGear()
honda.changeGear()
