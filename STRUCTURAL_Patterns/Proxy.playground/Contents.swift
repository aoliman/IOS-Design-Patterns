//MARK: - Proxy in used to hide the actual resource from the caller ,caller not know about the resource , Caller will use Proxy and Proxy will delegate the caller requests to actual resource.

//Benefits of Proxy Design Pattern
//1-Consumers/Calling components no need to know the underlying resource.
//2-We can Intercepts/adapt any operation before delegate it to actual resource.
//3-Changing the implementation of actual resource will not affect the calling components.
//4-Provides loose coupling as Proxy pattern operate on Abstraction.

protocol AppFeature {
    func upload()
    func download()
    func post()
    func comment()
}

class Application : AppFeature {
    func upload() {
        print("Upload successful")
    }
    func download() {
        print("Download successful")
    }
    func post() {
        print("Post successful")
    }
    func comment() {
        print("Comment successful")
    }
}

class ProxyApplication {
    var application:Application = Application()
    func upload(user:User) {
        if(user.permissions.contains("upload")) {
            application.upload()
        } else {
            print("No upload permission")
        }
    }
    func download(user:User) {
        if(user.permissions.contains("download")) {
            application.download()
        } else {
            print("No download permission")
        }
        
    }
    func post(user:User) {
        if(user.permissions.contains("post")) {
            application.post()
        } else {
            print("No post permission")
        }
        
    }
    func comment(user:User) {
        if(user.permissions.contains("comment")) {
            application.comment()
        } else {
            print("No comment permission")
        }
        
    }
}



class User {
    var name:String
    var permissions:[String] = []
    var proxyApplication:ProxyApplication = ProxyApplication()
    init(name:String, permissions:[String]) {
        self.name = name
        self.permissions = permissions
    }
    
    func performUpload(){proxyApplication.upload(user: self)}
    func performDownload(){proxyApplication.download(user: self)}
    func post(){proxyApplication.post(user: self)}
    func comment(){proxyApplication.comment(user: self)}
    
}


let user: User = User(name: "soliman", permissions: ["upload", "download","comment"])
user.performUpload()
user.performDownload()
user.post()
user.comment()
