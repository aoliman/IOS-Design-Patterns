//MARK: - Decorator pattern used for add behaviour  to object at runtime without modifying its classes, We can create mix and match behaviours to extend an object at runtime.

//Benefits of Decorator Design Pattern
//1- Avoid creation of multiple specialised subclasses for achieving mix and match functionality.
//2- Easy to add new behaviours.
//3- Greater flexibility than normal inheritance.


protocol Dress {
    func assemble()
}

class BasicDress : Dress {
    func assemble() {
        print("Basic dress features")
    }
}

class DressDecorator : Dress {
    var dress:Dress
    init(dress:Dress){
        self.dress = dress
    }
    func assemble() {
        dress.assemble()
    }
}

class SportDress : DressDecorator {
    override init(dress:Dress){
        super.init(dress: dress)
    }
    override func assemble() {
        super.assemble()
        print("Sporty Dress Features")
    }
}

class FancyDecorator : DressDecorator{
    override init(dress:Dress){
        super.init(dress: dress)
    }
    override func assemble() {
        super.assemble()
        print("Fancy Dress Features")
    }
}

class CasualDecorator : DressDecorator{
    override init(dress:Dress){
        super.init(dress: dress)
    }
    override func assemble() {
        super.assemble()
        print("Casual Dress Features")
    }
}

let  fancySportyCasual: Dress = FancyDecorator(dress: SportDress(dress: CasualDecorator(dress: BasicDress())))
fancySportyCasual.assemble()

