//
//  MainCoordinator.swift
//  Kbo League
//
//  Created by Karina on 13/07/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}


class MainCoordinator: Coordinator, TeamIdDelegate {
    func getTeamId(team: Int) {
        detailScreen.viewModel.id = team
    }
    
    let detailScreen = TeamsDetailsController()
 
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController =  navigationController
    }
    
    func start() {
        let controller = ViewController()
        controller.coordinator = self
        controller.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateToDetails() {
        detailScreen.coordinator = self
        navigationController.pushViewController(detailScreen, animated: true)
    }
}
