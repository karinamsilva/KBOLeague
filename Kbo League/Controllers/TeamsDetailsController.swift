//
//  TeamsDetailsController.swift
//  Kbo League
//
//  Created by Karina on 15/07/24.
//

import Foundation
import UIKit

class TeamsDetailsController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    let viewModel = TeamsDetailViewModel()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableConstraints()
        setTableViewDelegates()
        //title = "Team Stats"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDetails()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TeamDetailsView.self, forCellReuseIdentifier: TeamDetailsView.identifier)
        tableView.register(WinsCell.self, forCellReuseIdentifier: WinsCell.identifier)
        tableView.register(PointsCell.self, forCellReuseIdentifier: PointsCell.identifier)
    }
    
    func getDetails() {
        viewModel.requestTeams(fetchedData: { isLoadded, error in
            if isLoadded {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
            }})
    }
    
    func setTableConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension TeamsDetailsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell: TeamDetailsView = tableView.setupCellForSection(indexPath: indexPath)
            return viewModel.configCell(cell: cell, indexPath: indexPath)
        case 1:
            let cell: WinsCell = tableView.setupCellForSection(indexPath: indexPath)
            return viewModel.configWins(cell: cell, indexPath: indexPath, title: "Wins")
        case 2:
            let cell: WinsCell = tableView.setupCellForSection(indexPath: indexPath)
            return viewModel.configLoses(cell: cell, indexPath: indexPath, title: "Losses")
        case 3:
            let cell: PointsCell = tableView.setupCellForSection(indexPath: indexPath)
            return viewModel.configPointCell(cell: cell, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ?  170 :  90
    }
}

extension TeamsDetailsController: TeamIdDelegate {
    func getTeamId(team: Int) {
        viewModel.id = team
    }
}
