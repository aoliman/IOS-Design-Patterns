//MARK: - Bridge pattern separates an abstraction from its implementation , Bridge pattern solves a common inheritance design problem called Exploding class hierarchies.
//
//Benefits of Bridge Design Pattern
//1-Avoids creating multiple classes while adding a new feature.
//2-Requires only a single class when adding new feature to the system.
//3-Solves the exploding class hierarchies problem.
//4-Separates the abstraction from its implementation so both can change independently


protocol TV {
    var remote :Remote {get}
    func on()
    func off()
}

class SonyTv :TV {
    var remote :Remote
    init(remote :Remote) {
        self.remote = remote
    }
    func on() {
        print("SonyTV on")
    }
    
    func off() {
        print("SonyTV off")
    }
}

class SamsungTv :TV {
    var remote :Remote
    init(remote :Remote) {
        self.remote = remote
    }
    func on() {
        print("SamsungTv on")
    }
    
    func off() {
        print("SamsungTv off")
    }
}

protocol Remote {
    func increaseVolume()
    func decreaseVolume()
    func on()
    func off()
}

class BasicRemote : Remote{
    func increaseVolume() {
        print("Increase Volume")
    }
    func decreaseVolume() {
        print("Decrease Volume")
    }
    func on() {
        print("TV on")
    }
    func off() {
        print("TV off")
    }
}

class AdvancedRemote : Remote{
    func increaseVolume() {
        print("Increase Volume")
    }
    func decreaseVolume() {
        print("Decrease Volume")
    }
    func on() {
        print("TV on from Advanced Remote")
    }
    func off() {
        print("TV off from Advanced Remote")
    }
    func channelUp() {
        print("Channel up")
    }
    
    func channelDown() {
        print("Channel down")
    }
}
class SmartRemote: Remote {
    func increaseVolume() {
        print("Increase Volume")
    }
    func decreaseVolume() {
        print("Decrease Volume")
    }
    func on() {
        print("TV on from Smart Remote")
    }
    func off() {
        print("TV off from Smart Remote")
    }
    
    func channelUp() {
        print("Channel up")
    }
    
    func channelDown() {
        print("Channel down")
    }
    
    func openGames() {
        print("Select a game to play")
    }
  
}


let tv: TV = SonyTv(remote: SmartRemote())
tv.on()
tv.off()
tv.remote.on()
tv.remote.off()


