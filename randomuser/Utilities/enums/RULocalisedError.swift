//
//  RULocalisedError.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

enum RULocalisedError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self{
        case .invalidURL:
            return "error: URL invalid"
        case .invalidResponse:
            return "error: response invalid"
            
        case .invalidData:
            return "error: parsing error"
        }
    }
    
}
