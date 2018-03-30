

import Foundation
import UIKit

class BookListsView: UIView {
    
    var tableView: UITableView!
    
    lazy var barcodeReaderButton: UIButtonX = {
        let button = UIButtonX()
        button.isRound = true
        button.backgroundColor = UIColor.hex(hexStr: "#52ACFF", alpha: 1.0)
        button.setImage(UIImage(named: "photo_camera_36pt"), for: .normal)
        return button
    }()
    
    required init() {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: .zero)
        backgroundColor = .white
        setupTableView()
        addSubview(tableView)
        addSubview(barcodeReaderButton)
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
        
        barcodeReaderButton.translatesAutoresizingMaskIntoConstraints = false
        barcodeReaderButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15).isActive = true
        barcodeReaderButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 15).isActive = true
        barcodeReaderButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        barcodeReaderButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}


