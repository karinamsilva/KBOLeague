//
//  ErrorCases.swift
//  Kbo League
//
//  Created by Karina on 10/07/24.
//

import Foundation

enum ErrorCases: Error {
    case networkError
    case decodingError
    case serverError
}

extension ErrorCases: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return NSLocalizedString("Failed to decode data", comment: String())
        case .networkError:
            return NSLocalizedString("There's a network error, try again", comment: String())
        case .serverError:
            return NSLocalizedString("The server is out of service, try later", comment: String())
        }
    }
}


