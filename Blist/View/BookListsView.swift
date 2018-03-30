

import Foundation
import UIKit

class BookListsView: UIView {
    
    var tableView: UITableView!
    
    required init() {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: .zero)
        backgroundColor = .white
        setupTableView()
        addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        activateConstraints()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.bounces = false
        tableView.separatorColor = .lightGray
        tableView.sectionIndexColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        tableView.register(UINib(nibName: "BookListsTableViewCell", bundle: nil), forCellReuseIdentifier: "bookListsCell")
    }
    
    private func activateConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        tableView.estimatedRowHeight = frame.height / 10
        tableView.rowHeight = frame.height / 10
    }

}


