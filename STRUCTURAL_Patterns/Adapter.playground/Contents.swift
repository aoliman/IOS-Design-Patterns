//MARK: - adapter pattern allows two incompletable interface to work together , Converts one interface to another interface as Client expects.


protocol BasicPhone {
    func initiateCall()
    func disconnectCall()
}
class Nokia : BasicPhone {
    func initiateCall() {
        print("Basic initiate Call")
    }
    
    func disconnectCall() {
        print("Basic Disconnect Call")
    }
    
    
}
protocol  SmartPhone {
    func startCall()
    func endCall()
    func capturePhoto()
    func recordVedio()
}

class iPhone: SmartPhone {

    
    func startCall() {
        print("Call started...")
    }
    func endCall() {
        print("Call end...")
    }
    func capturePhoto() {
        print("Capturing Photo...")
    }
    func recordVedio() {
        print("Record Video...")
    }
}

class SmartAdapter : SmartPhone {

    var basicPhone:BasicPhone
    init(basicPhone:BasicPhone) {
        self.basicPhone = basicPhone
    }
    func startCall() {
        basicPhone.initiateCall()
    }
    
    func endCall() {
        basicPhone.disconnectCall()
    }
    
    func capturePhoto() {
        print("Doesnt support the Photo feature")
    }
    
    func recordVedio() {
        print("Doesnt support the Video feature")
    }
    
}


let nokia:Nokia = Nokia()
let smartPhone:SmartPhone = SmartAdapter(basicPhone: nokia)
smartPhone.startCall()
smartPhone.endCall()
smartPhone.capturePhoto()
smartPhone.recordVedio()
