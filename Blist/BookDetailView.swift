
import Foundation
import UIKit

class BookDetailView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    lazy var authorPlaceholder: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "著者"
        label.textAlignment = .center
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    lazy var publishedDatePlaceholder: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "発売日"
        label.textAlignment = .center
        return label
    }()
    
    lazy var publishedDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    lazy var pageCountPlaceholder: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "ページ数"
        label.textAlignment = .center
        return label
    }()
    
    lazy var pageCountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        return label
    }()
    
    lazy var explanationArea: UITextView = {
        let text = UITextView(frame: .zero)
        text.font = UIFont.systemFont(ofSize: 16)
        text.isEditable = false
        return text
    }()
    
    lazy var buyRakutenButton: UIButton = {
        let button = UIButtonX(frame: .zero)
        button.backgroundColor = .red
        button.setTitle("楽天で購入する", for: .normal)
        return button
    }()
    
    lazy var buyAmazonButton: UIButton = {
        let button = UIButtonX(frame: .zero)
        button.backgroundColor = .yellow
        button.setTitle("Amazonで購入する", for: .normal)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 30
        stackView.addArrangedSubview(buyRakutenButton)
        stackView.addArrangedSubview(buyAmazonButton)
        return stackView
    }()
    
    required init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(authorPlaceholder)
        addSubview(authorLabel)
        addSubview(publishedDatePlaceholder)
        addSubview(publishedDateLabel)
        addSubview(pageCountPlaceholder)
        addSubview(pageCountLabel)
        addSubview(explanationArea)
        addSubview(buttonStackView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        activateConstraints()
    }
    
    private func activateConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width / 2).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subtitleLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        authorPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        authorPlaceholder.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30).isActive = true
        authorPlaceholder.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        authorPlaceholder.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        authorPlaceholder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.topAnchor.constraint(equalTo: authorPlaceholder.bottomAnchor, constant: 20).isActive = true
        authorLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        authorLabel.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        publishedDatePlaceholder.translatesAutoresizingMaskIntoConstraints = false
        publishedDatePlaceholder.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30).isActive = true
        publishedDatePlaceholder.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        publishedDatePlaceholder.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        publishedDatePlaceholder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        publishedDateLabel.topAnchor.constraint(equalTo: authorPlaceholder.bottomAnchor, constant: 20).isActive = true
        publishedDateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        publishedDateLabel.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        publishedDateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
        pageCountPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        pageCountPlaceholder.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30).isActive = true
        pageCountPlaceholder.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        pageCountPlaceholder.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        pageCountPlaceholder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        pageCountLabel.translatesAutoresizingMaskIntoConstraints = false
        pageCountLabel.topAnchor.constraint(equalTo: authorPlaceholder.bottomAnchor, constant: 20).isActive = true
        pageCountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        pageCountLabel.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        pageCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        buttonStackView.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        explanationArea.translatesAutoresizingMaskIntoConstraints = false
        explanationArea.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20).isActive = true
        explanationArea.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        explanationArea.widthAnchor.constraint(equalToConstant: frame.width - 30).isActive = true
        explanationArea.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -30).isActive = true
        
    }
    
}
