//
//  ViewController.swift
//  Kbo League
//
//  Created by Karina on 09/07/24.
//

import UIKit

protocol TeamIdDelegate: AnyObject {
    func getTeamId(team: Int)
}

class ViewController: UIViewController {
    let service = ServiceKBO()
    let tableview = UITableView()
    let viewModel = TeamsViewModel()
    
    weak var delegate: TeamIdDelegate?
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableview()
        setTableConstraints()
        setDelegates()
        fetchTeamsList()
    }
    
    func fetchTeamsList() {
        viewModel.requestTeams { isLoaded, error in
            if isLoaded {
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } else {
            }
        }
    }
    
    func setDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setTableConstraints() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setTableview() {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(TeamsViewCell.self, forCellReuseIdentifier: "tableview")
        view.addSubview(tableview)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "tableview", for: indexPath) as? TeamsViewCell else { return UITableViewCell()}
        return viewModel.configCell(cell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = viewModel.teams[indexPath.row].id
        delegate?.getTeamId(team: text)
        coordinator?.navigateToDetails()
    }
}
