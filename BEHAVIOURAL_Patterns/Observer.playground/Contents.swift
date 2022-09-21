//MARK: - Observer used for Sends notifications to observers when state changes.

//protocol Observer {
//    var id:Int {get}
//    func notify(data:String)
//}
//
//protocol Subject {
//    var observers:[Observer] {get set}
//    var mobile: String {get set}
//    func registerObserver(observer: Observer)
//    func removeObserver(observer: Observer)
//    func notifyAll()
//}
//
//
//class Student :Observer  {
//    var id: Int
//    var name: String
//    init(  name: String,id: Int){
//        self.id = id
//        self.name = name
//    }
//    func notify(data: String) {
//        print("The updated mobile number is \(data)")
//    }
//}
//
//class Teacher :Subject {
//    var observers: [Observer] = []
//    var mobile: String {
//        didSet{
//            notifyAll()
//        }
//    }
//    var name: String
//    init(name: String, mobile: String) {
//        self.name = name
//        self.mobile = mobile
//    }
//    func registerObserver(observer: Observer) {
//        observers.append(observer)
//    }
//
//    func removeObserver(observer: Observer) {
//        observers.remove(at:observers.firstIndex(where: {$0.id == observer.id})! )
//    }
//
//    func notifyAll() {
//        for observer in observers {
//            observer.notify(data: mobile)
//        }
//    }
//}
//
//var teacher: Subject = Teacher(name: "Joe", mobile: "8904867753")
//let studentOne: Observer = Student(name: "Student 1", id: 1)
//let studentTwo: Observer = Student(name: "Student 2", id: 2)
//let studentThree: Observer = Student(name: "Student 3", id: 3)
//let studentFour: Observer = Student(name: "Student 4", id: 4)
//
//teacher.registerObserver(observer: studentOne)
//teacher.registerObserver(observer: studentTwo)
//teacher.registerObserver(observer: studentThree)
//teacher.registerObserver(observer: studentFour)
//
//teacher.mobile = "1234567899"
//


////////// observer in generic
///
///


protocol Observer {
    var id:Int {get}
    func notify(data:Any)
}


protocol SubjectProtocol {
    var observers:[Observer] {get set}
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAll()
}

class Subject<T> :SubjectProtocol {
    var observers: [Observer] = []
    var value: T {
           didSet{
               notifyAll()
           }
       }
       init(value: T) {
           self.value = value
       }
       func registerObserver(observer: Observer) {
           observers.append(observer)
       }
   
       func removeObserver(observer: Observer) {
           observers.remove(at:observers.firstIndex(where: {$0.id == observer.id})! )
       }
   
       func notifyAll() {
           for observer in observers {
               observer.notify(data: value)
           }
       }
    deinit {
           observers.removeAll()
       }
    
    
}
