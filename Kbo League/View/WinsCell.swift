//
//  WinsCell.swift
//  Kbo League
//
//  Created by Karina on 27/07/24.
//

import UIKit

class WinsCell: UITableViewCell {
    
    let homeWins: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awayWins: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let allWins: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews() {
        contentView.addSubview(winsLabel)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(homeWins)
        stackView.addArrangedSubview(awayWins)
        stackView.addArrangedSubview(allWins)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            winsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            winsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            winsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            
            stackView.topAnchor.constraint(equalTo: winsLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configureCellName(title: String) {
        winsLabel.text = title
    }
    
}
