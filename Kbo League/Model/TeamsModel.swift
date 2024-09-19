//
//  TeamsModel.swift
//  Kbo League
//
//  Created by Karina on 10/07/24.
//

import Foundation

struct TeamsModel: Codable {
    let response: [Teams]
}

struct Teams: Codable {
    let id: Int
    let name: String
    let logo: String
}

