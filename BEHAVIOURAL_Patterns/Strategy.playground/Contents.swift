//Mark: -  Startegy pattern used for Selects the right algorithm at run time. Strategy allows to implement multiple algorithms for an operation and selecting the right algorithm at run time. All the Algorithms will implement a common protocol.



protocol DBOperations{
    func create()
    func update()
    func delete()
    func read()
}



class LocalDB : DBOperations {
    func create() {
        print("Create from Local DB")
    }
    func update() {
        print("Update from Local DB")
    }
    func delete() {
        print("Delete from Local DB")
    }
    func read() {
        print("Read from Local DB")
    }
}

class RemoteDB : DBOperations {
    func create() {
        print("Create from Remote DB")
    }
    func update() {
        print("Update from Remote DB")
    }
    func delete() {
        print("Delete from Remote DB")
    }
    func read() {
        print("Read from Remote DB")
    }
}

enum Enviroment {case production,develop}

class StorageDB {
    var dB:DBOperations
    init(dBOperations:DBOperations) {
        self.dB = dBOperations
    }
    func create() {
        dB.create()
    }
    func update() {
        dB.update()
    }
    func delete() {
        dB.delete()
    }
    func read() {
        dB.read()
    }
}
var enviroment:Enviroment = .production
var dataBase:DBOperations = (enviroment == .develop) ? LocalDB() : RemoteDB()
var storage:StorageDB = StorageDB(dBOperations: dataBase)
storage.create()
storage.update()
storage.delete()
storage.read()
