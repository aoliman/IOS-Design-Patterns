//MARK: - Composite is allows to create Tree hierarchies , have two type of object in tree which are (leaf,individual,part) and (composite,collection,whole) that can be represented with a uniform interface

protocol CarPart {
    var name:String {get}
    var price:Double {get}
}

class IndividualPart : CarPart {
    var name: String
    var price: Double
    init(name: String , price: Double) {
        self.name = name
        self.price = price
    }
}


class CompositePart : CarPart {
    var name: String
    var parts:[CarPart] = []
    var price: Double {
        return parts.reduce(0) { total, part in
            return total + part.price
        }
    }
    init(name: String , parts: [CarPart]) {
        self.name = name
        self.parts = parts
    }
    func addPart(part: CarPart) {
        self.parts.append(part)
    }
    
    func removePart(part: CarPart) {
        parts.remove(at: parts.firstIndex(where:{$0.name == part.name})!)
//        for index in 0..<parts.count {
//            if parts[index].name == part.name {
//                parts.remove(at: index)
//            }
//        }
    }
    
}

class Customer {
    var name: String
    var parts:[CarPart] = []
    var totalOrderPrice: Double {
        return parts.reduce(0) { (total, part) -> Double in
            return total + part.price
        }
    }
    init(name: String , parts: [CarPart]) {
        self.name = name
        self.parts = parts
    }
    func printOrderDetails() {
        print("These are the Part prices")
        for part in parts {
            print("name: \(part.name) price: \(part.price)")
        }
        print("Total Order Price is \(totalOrderPrice)")
    }
}

let  windowDoor:CompositePart = CompositePart(name: "WindowDoor", parts: [IndividualPart(name: "Window Glass", price: 1000), IndividualPart(name: "Switch", price: 500)])
let door: CompositePart = CompositePart(name: "Door", parts:[windowDoor,IndividualPart(name: "Handler", price: 500)])
let seatCover: CarPart = IndividualPart(name: "Seat Cover", price: 1000)

let customer:Customer = Customer(name: "soliman", parts: [door,seatCover])

customer.printOrderDetails()
