
//MARK: -  Abstract factory is creational design pattern used for hide creation and selection logic from caller (Dependent class)

//MARK: - Abstract factory used to provide component to caller class , caller class ask factory to provide component from factory , Caller don’t need to know what object is selected or its underlying implementation , All the instances that Factory creates operate on a uniform interface.

//MARk: - Caller -(ask factory for instanse)> factory -(use abistarction to provide instanse)> abistraction (is protocol) -> (A abistraction , B abistraction) then factory return instanse to Callser

//Mark: - Caller -> factory ,  factory -> abistraction , abistraction -> (a ,b )  , factory -> caller


//Benefits of Abstract Factory Design Pattern
//1- Hides the object creation and selection logic from the Calling Component.
//   Provides a collection of related objects to the caller.
//2-Avoids the diffusion of Object Creation logic.
//3-As Factory instances operate on uniform interface it reduces the coupling.
//4-Increases the flexibility and extendability.

//MARk: - we use final to make class not able to inherit and make compile time more speed

//MARK: - Abstract Factory Design Pattern Implementation
class Computer {
    var cpu: CPU
    var gpu: GPU
    var display: Display
    
    init(cpu: CPU, gpu: GPU, display: Display) {
        self.cpu = cpu
        self.display = display
        self.gpu = gpu
    }
}

//MARK: - Abstraction
protocol CPU {
    var cores: Int { get }
}

protocol GPU {
    var speed: Int { get }
}

protocol Display {
    var resoultion: Int { get }
}


//MARK: - CPU
class BasicCPU: CPU {
    var cores: Int = 2
}

class StanderdCPU: CPU {
    var cores: Int = 4
}

class AdvancedCPU: CPU {
    var cores: Int = 8
}

//MARK: - GPU
class BasicGPU: GPU {
    var speed: Int = 1000
}

class StanderdGPU: GPU {
    var speed: Int = 2000
}

class AdvancedGPU: GPU {
    var speed: Int = 4000
}
//MARK: - Display
class BasicDisplay: Display {
    var resoultion: Int = 720
}

class StanderdDisplay: Display {
    var resoultion: Int = 1080
}

class AdvancedDisplay: Display {
    var resoultion: Int = 1660
}


//MARK: - Specs
enum Specifications {
    case Standerd, Basic, Advanced
}


class ComputerFactory {
    func createCPU() -> CPU {
           fatalError("Not Implemented")
       }
       
       func createGPU() -> GPU {
           fatalError("Not Implemented")
       }
       
       func createDisplay() -> Display {
           fatalError("Not Implemented")
       }
    
    static func makeComputerFactory(specifications:Specifications) -> ComputerFactory? {
        switch specifications{
        case .Standerd:
           return StanderdComputerFactory()
        case .Basic:
            return BasicComputerFactory()
        case .Advanced:
            return AdvancedComputerFactory()
        }
    }
}

class StanderdComputerFactory : ComputerFactory {
    override func createCPU() -> CPU {
        return StanderdCPU()
    }
    override func createGPU() -> GPU {
        return StanderdGPU()
    }
    override func createDisplay() -> Display {
        return StanderdDisplay()
    }
}
class BasicComputerFactory: ComputerFactory {
    override func createCPU() -> CPU {
        return BasicCPU()
    }
    override func createGPU() -> GPU {
        return BasicGPU()
    }
    override func createDisplay() -> Display {
        return BasicDisplay()
    }
}
class AdvancedComputerFactory: ComputerFactory {
    override func createCPU() -> CPU {
        return AdvancedCPU()
    }
    override func createGPU() -> GPU {
        return AdvancedGPU()
    }
    override func createDisplay() -> Display {
        return AdvancedDisplay()
    }
}


if let factory = ComputerFactory.makeComputerFactory(specifications: .Advanced) {
    let computer:Computer = Computer(cpu: factory.createCPU(), gpu: factory.createGPU(), display: factory.createDisplay())
    print(computer.cpu.cores)
    print(computer.gpu.speed)
    print(computer.display.resoultion)
}
