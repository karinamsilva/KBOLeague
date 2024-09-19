//
//  TeamsDetailViewModel.swift
//  Kbo League
//
//  Created by Karina on 15/07/24.
//

import Foundation

class TeamsDetailViewModel {
    
    var teams: [TeamsDetail] = []
    let service = ServiceKBO()
    var id = Int()
    
    func requestTeams(fetchedData: @escaping(Bool, ErrorCases?) -> Void) {
        service.requestTeamData(teamNumber: id,
                                completion: { result in
            switch result {
            case .success(let list):
                self.teams = list
                fetchedData(true, nil)
            case .failure(let error):
                fetchedData(false, error)
            }
        })
    }
    
    func configCell(cell: TeamDetailsView, indexPath: IndexPath) -> TeamDetailsView {
        cell.homeValue.text = "Home: \(teams[indexPath.row].games.played.home)"
        cell.awayValue.text = "Away: \(teams[indexPath.row].games.played.away)"
        cell.allValue.text = "All Games: \(teams[indexPath.row].games.played.all)"
        cell.teamName.text = "\(teams[indexPath.row].team.name) Team Stats"
        return cell
    }
    
    func configWins(cell: WinsCell, indexPath: IndexPath, title: String) -> WinsCell {
        cell.homeWins.text = "Home: \(teams[indexPath.row].games.wins.home.total)"
        cell.awayWins.text = "Away: \(teams[indexPath.row].games.wins.away.total)"
        cell.allWins.text = "All: \(teams[indexPath.row].games.wins.all.total)"
        cell.configureCellName(title: title)
        cell.backgroundColor = .systemGreen
        return cell 
    }
    
    func configLoses(cell: WinsCell, indexPath: IndexPath, title: String) -> WinsCell {
        cell.homeWins.text = "Home: \(teams[indexPath.row].games.loses.home.total)"
        cell.awayWins.text = "Away: \(teams[indexPath.row].games.loses.away.total)"
        cell.allWins.text = "All: \(teams[indexPath.row].games.loses.all.total)"
        cell.configureCellName(title: title)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    func configPointCell(cell: PointsCell, indexPath: IndexPath) -> PointsCell {
        cell.pointsLabel.text = "Total Points: \(teams[indexPath.row].points.forString.total.all)"
        cell.winPercentage.text = "Win percentage: \(teams[indexPath.row].games.wins.all.unwrappedPercent)"
        cell.lossesPercentage.text = "Losses percentage: \(teams[indexPath.row].games.loses.all.unwrappedPercent)"
        return cell
    }
}
