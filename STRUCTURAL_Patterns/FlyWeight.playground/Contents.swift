//MARk: - FlyWeight is used for Shares the common object data across calling components.


//What is FlyWeight Design Pattern
//1- FlyWeight pattern avoids creation of large number of similar objects that are required by multiple calling components.
//2- FlyWeight object has 2 types of states which are intrinsic and extrinsic.
//3- Intrinsic state doesn’t change. It is static to the object.
//4- Extrinsic state changes and set by the calling components

//Benefits of FlyWeight Design Pattern
//1- Optimise the performance and reduces of memory foot print of application by sharing the common objects.
//2- Avoids creation of similar objects unnecessarily.
//3- Flexible


protocol Pen {
    var color:String {get}
    var brush:String {get}
    func draw(color:String, content:String)
}

class ThickPen :Pen {
    var color: String
    var brush: String = "Thick"
    init(color: String) {
        self.color = color
    }
    func draw(color: String, content: String) {
        print("Drawing content \(content) in \(color) color")
    }
}

class ThinPen: Pen {
    var brush: String = "Thin"
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func draw(color: String, content: String){
        print("Drawing content \(content) in \(color) color")
    }
}

class MediumPen: Pen {
    var brush: String = "Medium"
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func draw(color: String, content: String){
        print("Drawing content \(content) in \(color) color")
    }
}

class PenFactory {
    static var cache:[String:Pen] = [:]
    static func getPen(color:String ,brush:String) -> Pen {
        let key = "\(brush)-\(color)"
        if let pen = PenFactory.cache[key]{
            print("Returning the existing Pen from cache")
            return pen
        }else{
            print("Creating a new Pen with brush \(brush) and color \(color)")
            var pen:Pen!
            switch brush {
            case "Thick" :
                pen = ThickPen(color: color)
            case "Thin" :
                pen = ThinPen(color: color)
            case "Medium" :
                pen = MediumPen(color: color)
            default:
                print("There is no such brush implementation")
            }
            PenFactory.cache[key] = pen
            return pen
            
        }
    }
    
}

let pen = PenFactory.getPen(color: "Red", brush: "Thin")
let pen2 = PenFactory.getPen(color: "Red", brush: "Thin")
let pen3 = PenFactory.getPen(color: "Red", brush: "Thin")
let yellowThinPen = PenFactory.getPen(color: "Yellow", brush:  "Thin")
let yellowThickPen =  PenFactory.getPen(color: "Yellow", brush:  "Thick")
let sameYelloThickPen =  PenFactory.getPen(color: "Yellow", brush:  "Thick")
sameYelloThickPen.draw(color: "Yello", content: "Hello!")

