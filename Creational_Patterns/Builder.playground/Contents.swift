//MARK: -  Separates configuration of the object from its creation , Hides the object creation logic from the calling components , make it easy to change for creation instanse

class Burger {
    var name: String
    var toppings: Bool
    var ketchep: Bool
    var isVeg: Bool
    var isSpicy: Bool
    var cheese: Bool
    
    init(name: String, toppings: Bool, ketchep: Bool, isVeg: Bool, isSpicy: Bool, cheese: Bool) {
        self.name = name
        self.toppings = toppings
        self.ketchep = ketchep
        self.isVeg = isVeg
        self.isSpicy = isSpicy
        self.cheese = cheese
    }
}

class BurgerBuilder {
    var toppings: Bool = true
    var ketchep: Bool = true
    var isVeg: Bool = true
    var isSpicy: Bool = false
    var cheese: Bool = false
    
    func setToppings(toppings: Bool) {
        self.toppings = toppings
    }
    
    func setKetchep(ketchep: Bool) {
        self.ketchep = ketchep
    }
    
    func setVeg(isVeg: Bool) {
        self.isVeg = isVeg
    }
    
    func setSpicy(isSpicy: Bool) {
        self.isSpicy = isSpicy
    }
    
    func setCheese(cheese: Bool) {
        self.cheese = cheese
    }
    
    func buildBurger(name: String) -> Burger {
        return Burger(name: name, toppings: self.toppings, ketchep: self.ketchep, isVeg: self.isVeg, isSpicy: self.isSpicy, cheese: self.cheese)
    }
}


let burgerBuilder = BurgerBuilder()
burgerBuilder.setVeg(isVeg: false)
burgerBuilder.setSpicy(isSpicy: true)

let burger = burgerBuilder.buildBurger(name: "My Favourite")
print(burger.isVeg)
print(burger.isSpicy)
