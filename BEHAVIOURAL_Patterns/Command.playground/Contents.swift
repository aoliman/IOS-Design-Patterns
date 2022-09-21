//MARk: - Command used to invoke method on object with out the method details.




protocol Receiver {
    var isOn: Bool {get set}
    func on()
    func off()
}

class Buld: Receiver {
    var isOn: Bool = false
    func on() {
        isOn = true
        print("Buld is On")
    }
    func off() {
        isOn = false
        print("Buld is Off")
    }
}

class Fan: Receiver {
    var isOn: Bool = false
    
    func on() {
        isOn = true
        print("Fan is On")
    }
    func off() {
        isOn = false
        print("Fan is Off")
    }
}

protocol Command {
    func execute()
    func undo()
}

class TurnOnCommand: Command {
    var receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.on()
    }
    func undo() {
        if(receiver.isOn) {
            self.receiver.off()
        } else {
            self.receiver.on()
        }
    }
}

class Invoker {
    var command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func execute() {
        command.execute()
    }
    
    func undo() {
        command.undo()
    }
}

let invoker: Invoker = Invoker(command: TurnOnCommand(receiver: Fan()))
invoker.execute()
invoker.undo()

