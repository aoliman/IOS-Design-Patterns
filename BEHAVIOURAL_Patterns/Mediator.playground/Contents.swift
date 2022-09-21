//MARk: - Mediator used to Mediates communication between multiple related objects



protocol Mediator {
    var colleagues: [Colleague] {get set}
    func send(message: String, id: Int)
    func addColleague(colleague: Colleague)
}

class ControlTower: Mediator {
    var colleagues: [Colleague] = []
    
    func send(message: String, id: Int) {
        for colleague in colleagues {
            if(colleague.id != id) {
                colleague.receive(message: message)
            }
        }
    }
    func addColleague(colleague: Colleague) {
        self.colleagues.append(colleague)
    }
}

protocol Colleague {
    var id: Int {get}
    var mediator: Mediator {get}
    
    func send(message: String)
    func receive(message: String)
}

class AeroPlane: Colleague {
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, id: self.id)
    }
    func receive(message: String) {
        print("Message received from Control Tower to AeroPlane: \(message)")
    }
}

class Zet: Colleague {
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, id: self.id)
    }
    func receive(message: String) {
        print("Message received from Control Tower to Zet: \(message)")
    }
}

class Chopper: Colleague {
    var id: Int
    var mediator: Mediator
    
    init(id: Int, mediator: Mediator) {
        self.id = id
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, id: self.id)
    }
    func receive(message: String) {
        print("Message received from Control Tower to Chopper: \(message)")
    }
}

let mediator: Mediator = ControlTower()
let aeroPlane: Colleague = AeroPlane(id: 1, mediator: mediator)
let zet: Colleague = Zet(id: 2, mediator: mediator)
let chopper: Colleague = Chopper(id: 3, mediator: mediator)

mediator.addColleague(colleague: aeroPlane)
mediator.addColleague(colleague: zet)
mediator.addColleague(colleague: chopper)

//aeroPlane.send(message: "AeroPlan is going to land...")
zet.send(message: "Zet is going to land...")


