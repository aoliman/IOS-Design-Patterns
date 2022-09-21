//MArk: - Chain of Responsibility is allwos to setup chain to handel or forward request to corresponde object with the chain

protocol Deductable{
    var next :Deductable? {get set}
    func detucte(amount:Double)
    static func createChain() -> Deductable
}
extension Deductable {
    static func createChain()  -> Deductable {
        let savingAccount:SavingAccount = SavingAccount()
        let fixedAccount:FixedAccount = FixedAccount()
        let currentAccount:CurrentAccount = CurrentAccount()
        savingAccount.next = fixedAccount
        fixedAccount.next = currentAccount
        return savingAccount
    }
}

class SavingAccount:Deductable {
    var next: Deductable?
    func detucte(amount: Double) {
        if amount <= 1000 {
            print("Amount deducted from Saving Account")
        }else{
            next?.detucte(amount: amount)
        }
    }
}

class FixedAccount:Deductable {
    var next: Deductable?
    func detucte(amount: Double) {
        if(amount > 1000 && amount <= 100000) {
            print("Amount deducted from Fixed Account")
        }else{
            next?.detucte(amount: amount)
        }
    }
}

class CurrentAccount:Deductable {
    var next: Deductable?
    func detucte(amount: Double) {
        if(amount > 100000) {
            print("Amount deducetd from Current Account")
        }else{
            next?.detucte(amount: amount)
        }
    }
}

class Customer {
    var name:String
    init(name:String) {
        self.name = name
    }
    func deductAmount(amount:Double){
        let account : Deductable = FixedAccount.createChain()
        account.detucte(amount: amount)
    }
}


let customer: Customer = Customer(name: "Joe")
customer.deductAmount(amount: 100)
customer.deductAmount(amount: 10000)
customer.deductAmount(amount: 1000000)
