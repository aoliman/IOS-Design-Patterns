
//MARK: - object bool Creates and reuses a collection of similar objects , Provides objects to the calling components from the Pool , create multi object and reuse them  it like singletone butt for multi object
//
//1- Hides the creation logic from the calling components.
//2- Avoids the expensive initialisation of objects by reusing them.
//3- Represents a collection of real world resources.
//4- Increases the flexibility
//5- Need to handle multi threading scenarios and corner cases.(problem)


class Book {
    var title:String
    var author:String
    init(title:String , author:String) {
        self.title = title
        self.author = author
    }
}


class BookPool {
    var books:[Book]
    init(books:[Book]) {
        self.books = books
    }
    
    func getBook() -> Book? {
        if(books.isEmpty){
            print("BookBool is empity")
            return nil
        }
        return books.removeFirst()
    }
    
    func returnBook(book:Book){
        books.append(book)
    }
}


//let bookBool =  BookPool(books: [Book(title: "title 1", author: "author 1"),Book(title: "title 2", author: "author 2"),Book(title: "title 3", author: "author 3")])
//
//let book1 = bookBool.getBook()
//let book2 = bookBool.getBook()
//let book3 = bookBool.getBook()
//let book4 = bookBool.getBook()
//let book5 = bookBool.getBook()
//
//bookBool.returnBook(book: book2!)
//
//let book6 = bookBool.getBook()
//bookBool.returnBook(book: Book(title: "title 4", author: "author 4"))
//let book7 = bookBool.getBook()
//let book8 = bookBool.getBook()
