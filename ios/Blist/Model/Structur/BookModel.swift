
import Foundation
import UIKit
import SwiftyJSON

struct Book {
    let title: String
    let subTitle: String
    let description: String
    let publishedDate: String
    let reviewAverage: String
    let authors: String
    let itemUrl: String
    let ISBN: String
    let itemPrice: Int
    var imageLink: String

    init(_ json: JSON) {
        title = json["Items"][0]["Item"]["title"].string ?? ""
        subTitle = json["Items"][0]["Item"]["subTitle"].string ?? ""
        description = json["Items"][0]["Item"]["itemCaption"].string ?? ""
        publishedDate = json["Items"][0]["Item"]["salesDate"].string ?? ""
        reviewAverage = json["Items"][0]["Item"]["reviewAverage"].string ?? ""
        itemUrl = json["Items"][0]["Item"]["itemUrl"].string ?? ""
        authors = json["Items"][0]["Item"]["author"].string ?? ""
        itemPrice = json["Items"][0]["Item"]["itemPrice"].int ?? 0
        ISBN = json["Items"][0]["Item"]["isbn"].string ?? ""

        imageLink = ""
        if let value = json["Items"][0]["Item"]["mediumImageUrl"].url {
            imageLink = value.absoluteString
        }
        
    }
    
}
