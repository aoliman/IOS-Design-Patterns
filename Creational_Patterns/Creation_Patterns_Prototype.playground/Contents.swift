//MARK: - prototype is creational design pattern used for create new object from exist object that help to reduce used in memory

import UIKit

//class Player {
//    var name: String
//    var score : Int
//    init(name:String , score:Int) {
//        self.name = name
//        self.score = score
//    }
//
//}
//
//let player: Player = Player(name: "Joe", score: 99)
////platerClone is the copy created from the player prototype.
//let playerClone: Player = player
//
//print(player.name)
//print(player.score)
//
//playerClone.name = "Sam"
//playerClone.score = 100
//
//print(playerClone.name)
//print(playerClone.score)
//
//print(player.name)
//print(player.score)

////MARK:- implement ProtoType
//class Player {
//    var name: String
//    var score : Int
//    init(name:String , score:Int) {
//        self.name = name
//        self.score = score
//    }
//    func copy() -> Player {
//        return Player(name: self.name, score: self.score)
//    }
//
//
//}
//
//let player: Player = Player(name: "Joe", score: 99)
//let playerClone: Player = player.copy()
//
//print(player.name)
//print(player.score)
//
//playerClone.name = "Sam"
//playerClone.score = 100
//
//print(playerClone.name)
//print(playerClone.score)
//
//print(player.name)
//print(player.score)
//



////MARK:-  ProtoType with apple standerd implemention
//class Player :NSObject , NSCopying{
//    var name: String
//    var score : Int
//    init(name:String , score:Int) {
//        self.name = name
//        self.score = score
//    }
//    func copy(with zone: NSZone? = nil) -> Any {
//        return Player(name: self.name, score: self.score)
//    }
//
//}
//
//let player: Player = Player(name: "Joe", score: 99)
//let playerClone: Player = player.copy() as! Player
//
//print(player.name)
//print(player.score)
//
//playerClone.name = "Sam"
//playerClone.score = 100
//
//print(playerClone.name)
//print(playerClone.score)
//
//print(player.name)
//print(player.score)

////MARK:-  ProtoType with apple standerd implemention with shallow copy
//
//import UIKit
//class Meeting: NSObject, NSCopying {
//var name: String
//var location: Location
//init(name: String, location: Location) {
//    self.name = name
//    self.location = location
//}
//    func copy(with zone: NSZone? = nil) -> Any {
//    return Meeting(name: self.name, location: self.location)
//}
//}
//
//class Location {
//    var place: String
//      init(place: String) {
//          self.place = place
//       }
//}
//let meeting = Meeting(name: "WWDC", location: Location(place: "California"));
//let clone = meeting.copy() as! Meeting
//meeting.location.place = "New York"
//
//print(meeting.name)
//print(meeting.location.place)
//
//print(clone.name)
//print(clone.location.place)

//MARK:-  ProtoType with apple standerd implemention with deep copy

import UIKit
class Meeting: NSObject, NSCopying {
var name: String
var location: Location
init(name: String, location: Location) {
    self.name = name
    self.location = location
}
    func copy(with zone: NSZone? = nil) -> Any {
        return Meeting(name: self.name, location: self.location.copy() as! Location)
}
}

class Location: NSObject, NSCopying {
    var place: String
      init(place: String) {
          self.place = place
       }
    func copy(with zone: NSZone? = nil) -> Any {
        return Location(place: self.place)
    }
}
let meeting = Meeting(name: "WWDC", location: Location(place: "California"));
let clone = meeting.copy() as! Meeting
meeting.location.place = "New York"
print(meeting.name)
print(meeting.location.place)

print(clone.name)
print(clone.location.place)
