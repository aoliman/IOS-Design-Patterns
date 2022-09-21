//Mark: - Facade is used for hide complexity of dependencies by provide a simple api to caller,caller use the Facade to actually perform the required operations


//Benefits of Facade Design Pattern
//1-Consumers/Calling components no need to know the underlying resource.
//2-Provides a simple API for the Consumers.
//3-Changing the implementation of actual resource will not affect the calling components.
//4-Reduces coupling on calling components.




protocol shape {
    func draw()
}

class Circle : shape {
    func draw() {
        print("Circle Drawn")
    }
}
class Square : shape {
    func draw() {
        print("Square Drawn")
    }
}
class Rectangle : shape {
    func draw() {
        print("Rectangle Drawn")
    }
}
class ShapeFacad {
    private let circle:Circle = Circle()
    private let square:Square = Square()
    private let rectangle:Rectangle = Rectangle()
    func drawCircle(){
        circle.draw()
    }
    func drawSquare(){
        square.draw()
    }
    func drawRectangle(){
        rectangle.draw()
    }
}
class ShapeMaker {
    var shapeFacad:ShapeFacad
    init(shapeFacad:ShapeFacad) {
        self.shapeFacad = shapeFacad
    }
    func drawCircle(){
        shapeFacad.drawCircle()
    }
    func drawSquare(){
        shapeFacad.drawSquare()
    }
    func drawRectangle(){
        shapeFacad.drawRectangle()
    }
}
