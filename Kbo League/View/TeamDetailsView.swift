//
//  TeamDetailsView.swift
//  Kbo League
//
//  Created by Karina on 15/07/24.
//

import Foundation
import UIKit

class TeamDetailsView: UITableViewCell {

    let section: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Games"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let teamName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        return label
    }()
    
    let homeValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let awayValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let allValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let allValue2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(teamName)
        contentView.addSubview(section)
        contentView.addSubview(rightStack)
        
        rightStack.addArrangedSubview(homeValue)
        rightStack.addArrangedSubview(awayValue)
        rightStack.addArrangedSubview(allValue)
        rightStack.addArrangedSubview(allValue2)

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            teamName.topAnchor.constraint(equalTo: contentView.topAnchor),
            teamName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            teamName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            section.topAnchor.constraint(equalTo: teamName.bottomAnchor, constant: 7),
            section.leadingAnchor.constraint(equalTo: teamName.leadingAnchor),
            section.trailingAnchor.constraint(equalTo: teamName.trailingAnchor),
            
            rightStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            rightStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            rightStack.topAnchor.constraint(equalTo: section.bottomAnchor, constant: 7),
            rightStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

        ])
    }
}
