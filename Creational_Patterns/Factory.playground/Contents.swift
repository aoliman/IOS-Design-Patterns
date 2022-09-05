
//MARK: - factory is creational design pattern used for hide creation and selection logic from caller (Dependent class)

//MARK: - factory used to provide component to caller class , caller class ask factory to provide component from factory , Caller don’t need to know what object is selected or its underlying implementation

//MARk: - Caller -(ask factory for instanse)> factory -(use abistarction to provide instanse)> abistraction (is protocol) -> (A abistraction , B abistraction) then factory return instanse to Callser

//Mark: - Caller -> factory ,  factory -> abistraction , abistraction -> (a ,b )  , factory -> caller


//Benefits of Factory Design Pattern
//1- Hides the object creation and selection logic from the Calling Component.
//  Provides a single object to the caller.
//2-Avoids the diffusion of Object Creation logic.
//3-As Factory instances operate on uniform interface it reduces the coupling.
//4-Increases the flexibility and extendability.

//MARk: - we use final to make class not able to inherit and make compile time more speed

import UIKit
//MARk: - caller class
class Person {
    var name: String
    var mobile: Mobile
    init(name: String, mobile: Mobile) {
        self.name = name
        self.mobile = mobile
    }
}

//MARk: - Abstraction Class
protocol Mobile {
    var os: String {get}
    var color: String {get}
    var cost: Double {get}
}

//MARk: - Abstraction Imp
class Apple: Mobile {
    var os: String
    var color: String
    var cost: Double
    init(os: String, color: String, cost: Double) {
        self.os = os
        self.color = color
        self.cost = cost
    }
}

//MARk: - Abstraction Imp
class Samsung: Mobile {
    var os: String
    var color: String
    var cost: Double
    init(os: String, color: String, cost: Double) {
        self.os = os
        self.color = color
        self.cost = cost
    }
}

enum Brand {case Apple,Samsung}

//MARk: - Factory Imp
class MobileFactory {
    static func makeMobile(brand:Brand) -> Mobile?{
        var mobile: Mobile?
        switch brand{
        case .Apple:
            mobile = Apple(os: "iOS", color: "Zet Black", cost: 500000)
        case .Samsung:
            mobile = Samsung(os: "Android", color: "White", cost: 250000)
        }
        return mobile
    }
}

let person: Person = Person(name: "Joe", mobile: MobileFactory.makeMobile(brand: .Samsung)!)

print(person.name)
print(person.mobile.os)
print(person.mobile.cost)
print(person.mobile.color)

                           
