
import Foundation
import UIKit
import SwiftyJSON

struct Book {
    let title: String
    let subTitle: String
    let description: String
    let publishedDate: String
    let pageCount: Int
    var imageLink: String
    var authors = [String]()
    let textSnipets: String
    let ISBN_10: String
    let ISBN_13: String
    
    init(_ json: JSON) {
        title = json["items"][0]["volumeInfo"]["title"].string ?? ""
        subTitle = json["items"][0]["volumeInfo"]["subtitle"].string ?? ""
        description = json["items"][0]["volumeInfo"]["description"].string ?? ""
        publishedDate = json["items"][0]["volumeInfo"]["publishedDate"].string ?? ""
        pageCount = json["items"][0]["volumeInfo"]["pageCount"].int ?? 0
        
        imageLink = ""
        if let value = json["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"].url {
            imageLink = value.absoluteString
        }
        
        for (_, value) in json["items"][0]["volumeInfo"]["authors"] {
            self.authors.append(value.string!)
        }
        
        textSnipets = json["items"][0]["searchInfo"]["textSnippet"].string ?? ""
        ISBN_13 = json["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"].string ?? ""
        ISBN_10 = json["items"][0]["volumeInfo"]["industryIdentifiers"][0]["identifier"].string ?? ""
        
    }
}
