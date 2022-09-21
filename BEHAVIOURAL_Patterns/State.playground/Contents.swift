//MARK: - State in used for alter the behaviour of Object when state changes.





protocol GearState {
    func gearUp()
    func gearDown()
}

class FirstGear: GearState {
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = SecondGear(bike: bike)
        print("Bike moved from First gear to second")
    }
    func gearDown() {
        print("Bike already in First Gear")
    }
}

class SecondGear: GearState {
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = ThirdGear(bike: bike)
        print("Bike moved from Second gear to Third")
    }
    func gearDown() {
        self.bike.gearState = FirstGear(bike: bike)
    }
}

class ThirdGear: GearState {
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        self.bike.gearState = FourthGear(bike: bike)
        print("Bike moved from Third gear to Fourth")
    }
    func gearDown() {
        self.bike.gearState = ThirdGear(bike: bike)
    }
}

class FourthGear: GearState {
    var bike: Bike
    
    init(bike: Bike) {
        self.bike = bike
    }
    
    func gearUp() {
        print("Bike already in Fourth Gear")
    }
    func gearDown() {
        self.bike.gearState = ThirdGear(bike: bike)
    }
}


class Bike {
    lazy var gearState: GearState = {
       return FirstGear(bike: self)
    }()
    
    init() {
        
    }
    
    func gearUp() {
        self.gearState.gearUp()
    }
    
    func gearDown() {
        self.gearState.gearDown()
    }
}

let bike: Bike = Bike()
bike.gearUp()
bike.gearUp()
bike.gearUp()
