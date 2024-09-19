//
//  ServiceKBO.swift
//  Kbo League
//
//  Created by Karina on 09/07/24.
//

import Foundation

protocol KBOServiceProtocol : AnyObject {
    func requestTeams(completion: @escaping(Result<[Teams], ErrorCases>) -> Void)
    func requestTeamData(completion: @escaping(Result<[TeamsDetail], ErrorCases>) -> Void)
}

class ServiceKBO {
    
    func requestTeams(completion: @escaping(Result<[Teams], ErrorCases>) -> Void) {
        
        guard let endpoint = URL(string: Constants.endpoint) else { return }
        var request = URLRequest(url: endpoint)
        request.addValue(Constants.apiKeys, forHTTPHeaderField: Constants.apiKeyParam)
        request.addValue(Constants.source, forHTTPHeaderField: Constants.hostParam)
        request.httpMethod = Constants.requestType
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let teams = try JSONDecoder().decode(TeamsModel.self, from: data)
                completion(.success(teams.response))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        dataTask.resume()
    }
    
    func requestTeamData(teamNumber: Int, completion: @escaping(Result<[TeamsDetail], ErrorCases>) -> Void) {
        guard let endpoint = URL(string: "\(Constants.endpoint2)" + "\(teamNumber)") else { return }
        var request = URLRequest(url: endpoint)
        request.addValue(Constants.apiKeys, forHTTPHeaderField: Constants.apiKeyParam)
        request.addValue(Constants.source, forHTTPHeaderField: Constants.hostParam)
        request.httpMethod = Constants.requestType
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            do {
                let teams = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success([teams.response]))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        dataTask.resume()
    }
}
