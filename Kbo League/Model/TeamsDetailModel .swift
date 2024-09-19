//
//  TeamsDetailModel .swift
//  Kbo League
//
//  Created by Karina on 15/07/24.
//

import Foundation


struct Welcome: Codable {
    let welcomeGet: String
    let parameters: Parameters
    let results: Int
    let response: TeamsDetail

    enum CodingKeys: String, CodingKey {
        case welcomeGet = "get"
        case parameters, results, response
    }
}

struct Parameters: Codable {
    let league, season, team: String
}

struct TeamsDetail: Codable {
    let team: Team
    let games: Games
    let points: Points
}


struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct Games: Codable {
    let played: Played
    let wins, loses: Wins
}

struct Points: Codable {
    let forString: PointData
    
    enum CodingKeys: String, CodingKey {
        case forString = "for"
    }
}

struct PointData: Codable {
    let total: Played
}

struct Played: Codable {
    let home: Int
    let away: Int
    let all: Int
}

struct Wins: Codable {
    let home, away, all: All
}

struct All: Codable {
    let total: Int
    let percentage: String?
    
    var unwrappedPercent: String {
        if let new = percentage {
            return new
        } else {
            return String()
        }
    }
}
