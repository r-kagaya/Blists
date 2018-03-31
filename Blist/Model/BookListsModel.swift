
import Foundation
import UIKit


class BookListsModel: NSObject, UITableViewDataSource {
    
    lazy var bookLists = {
       return BookLists.datas
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookListsCell", for: indexPath) as! BookListsTableViewCell
        let listItem = bookLists[indexPath.row]
        cell.titleLabel.text = listItem.title + "~" + listItem.subTitle + "~"
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    
}


