//MARK: - Visitor used to operate algorithms on collection of heterogeneous objects

protocol Visitor {
    func visit(shape: Circle)
    func visit(shape: Rectangle)
    func visit(shape: Square)
}

class AreaVisitor: Visitor {
    var totalArea: Double = 0.0
    func visit(shape: Circle) {
        totalArea += Double.pi * pow(shape.radius, 2)
    }
    func visit(shape: Rectangle) {
        totalArea += shape.length * shape.breadth
    }
    func visit(shape: Square) {
        totalArea += pow(shape.length, 2)
    }
}


protocol Shape {
    func accept(visitor: Visitor)
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(shape: self)
    }
}

class Rectangle: Shape {
    var length: Double
    var breadth: Double
    
    init(length: Double, breadth: Double) {
        self.length = length
        self.breadth = breadth
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(shape: self)
    }
}

class Square: Shape {
    var length: Double
    
    init(length: Double) {
        self.length = length
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(shape: self)
    }
}

class ShapeCollection {
    var shapes: [Shape] = []
    
    init(shapes: [Shape]) {
        self.shapes = shapes
    }
    
    func accept(visitor: Visitor) {
        for shape in shapes {
            shape.accept(visitor: visitor)
        }
    }
}

let shapeCollection: ShapeCollection = ShapeCollection(shapes: [Circle(radius: 5), Square(length: 40), Rectangle(length: 10, breadth: 10)])

let areaVisitor: AreaVisitor = AreaVisitor()
shapeCollection.accept(visitor: areaVisitor)
print(areaVisitor.totalArea)
