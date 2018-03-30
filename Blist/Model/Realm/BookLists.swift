
import Foundation
import RealmSwift

enum BookListsModelQuery: String {
    case id = "id"
    case createdAt = "createdAt"
    case tipsNumber = "tipsNumber"
    case type = "type"
    case title = "title"
    case isOffline = "isOffline"
}

class Authors: Object {
    @objc dynamic var authorName = ""
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
        model.pageCount = books.pageCount
        model.imageLink = books.imageLink.absoluteString
        model.authors = books.authors
        model.textSnipets = books.textSnipets
        model.identifier = books.identifier
        model.createdAt = Utility.getNowClockString()

        try! BookLists.realm.write {
            BookLists.realm.add(model)
        }
    }
    
    var authors: [String] {
        get {
            return _authors.map { $0.authorName }
        }
        set {
            _authors.removeAll()
            _authors.append(objectsIn: (newValue.map( { Authors(value: [$0]) })))
        }
    }
    
    @objc dynamic var id = 1
    @objc dynamic var title = String()
    @objc dynamic var subTitle = String()
    @objc dynamic var explanation = String()
    @objc dynamic var publishedDate = String()
    @objc dynamic var textSnipets = String()
    @objc dynamic var identifier = String()
    @objc dynamic var createdAt = String()
    @objc dynamic var pageCount = Int()
    @objc dynamic var imageLink = String()
    private var _authors = List<Authors>()

    override static func primaryKey() -> String? {
        return "id"
    }
    
}



