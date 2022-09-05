//MARK: - singleton is creational design pattern used for create one instanse for app life cycle , limite create one instanse for class
//MARK: - used when need one instanse for all reference like connection with database , or network
//MARk: - avoid to use singletone when use concurrency
//Mark: - can implement only for reference type like class not for value type like struct and enums


import UIKit
//MARk: - we use final to make class not able to inherit and make compile time more speed
final class ColorPicker {
    var colors: [UIColor] = [.gray, .green, .red]
    static let shared: ColorPicker = ColorPicker()
    private init() {}
    func getRandomColor() -> UIColor? {
        return colors.randomElement()
    }
}
class A {
    init() {
        if let color = ColorPicker.shared.getRandomColor() {
            print (color)
        }
    }
    func addColor(color: UIColor) {
        ColorPicker.shared.colors
    }
}
class B {
    init() {
        if let color = ColorPicker.shared.getRandomColor() {
            print (color)
        }
    }
    func displayColors() {
        print(ColorPicker.shared.colors)
    }
}
class C {
    init() {
        if let color = ColorPicker.shared.getRandomColor() {
            print(color)
        }
    }
    func displayColors() {
        print(ColorPicker.shared.colors)
    }
}
let a: A = A()
let b: B = B()
let c: C = C()
print("Testing Data Members")
a.addColor(color: UIColor.yellow)
b.displayColors()
c.displayColors()

