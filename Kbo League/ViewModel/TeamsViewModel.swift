//
//  TeamsViewModel.swift
//  Kbo League
//
//  Created by Karina on 10/07/24.
//

import Foundation

class TeamsViewModel {

    var teams: [Teams] = []
    let service = ServiceKBO()
    
    func requestTeams(fetchedData: @escaping(Bool, ErrorCases?) -> Void) {
        service.requestTeams{ result in
            switch result {
            case .success(let list):
                self.teams = list
                fetchedData(true, nil)
            case .failure(let error):
                fetchedData(false, error)
            }
        }
    }
    
    func configCell(cell: TeamsViewCell, indexPath: IndexPath) -> TeamsViewCell {
        cell.teamName.text = teams[indexPath.row].name
        cell.teamLogo.loadImage(with: teams[indexPath.row].logo)
        cell.selectionStyle = .none
        return cell
    }

}
