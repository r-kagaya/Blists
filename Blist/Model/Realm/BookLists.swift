
import Foundation
import RealmSwift

enum BookListsModelQuery: String {
    case id = "id"
    case createdAt = "createdAt"
    case title = "title"
}

class BookLists: Object {
    
    static let realm = try! Realm()
    
    static var datas: Results<BookLists> {
        let datas = BookLists.realm.objects(BookLists.self).sorted(byKeyPath: "id", ascending: false)
        return datas
    }
    
    static func getNewId() -> Int {
        let maxId = BookLists.realm.objects(BookLists.self).sorted(byKeyPath: "id").last?.id ?? 0
        return maxId + 1
    }
    
    static func sort(queryType: BookListsModelQuery, ascending: Bool = false) -> Results<BookLists> {
        return BookLists.realm.objects(BookLists.self).sorted(byKeyPath: queryType.rawValue, ascending: ascending)
    }
    
    static func search(queryType: BookListsModelQuery, query: String) -> Results<BookLists> {
        return BookLists.datas.filter("\(queryType.rawValue) == %@", query)
    }
    
    static func registrerBookList(books: Book) {
        let model = BookLists()
        model.id = BookLists.getNewId()
        model.title = books.title
        model.subTitle = books.subTitle
        model.explanation = books.description
        model.publishedDate = books.publishedDate
        model.itemPrice = books.itemPrice
        model.imageLink = books.imageLink
        model.authors = books.authors
        model.ISBN = books.ISBN
        model.reviewAverage = books.reviewAverage
        model.itemUrl = books.itemUrl
        model.createdAt = Utility.getNowClockString()
        try! BookLists.realm.write {
            BookLists.realm.add(model)
        }
    }
    
    static func deleteBookList(item: BookLists) {
//        guard let listItem = BookLists.search(queryType: type, query: String(id)).last else { return }
        try! BookLists.realm.write() {
            BookLists.realm.delete(item)
        }
    }

    @objc dynamic var id = 1
    @objc dynamic var title = String()
    @objc dynamic var subTitle = String()
    @objc dynamic var explanation = String()
    @objc dynamic var publishedDate = String()
    @objc dynamic var ISBN = String()
    @objc dynamic var createdAt = String()
    @objc dynamic var itemUrl = String()
    @objc dynamic var reviewAverage = String()
    @objc dynamic var imageLink = String()
    @objc dynamic var authors = String()
    @objc dynamic var itemPrice = Int()

    override static func primaryKey() -> String? {
        return "id"
    }
    
}



