//
//  RandomUserService.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

final class RandomUserService {
  
    static func getRandomUsers(result: String) async throws -> RandomUser {
        let endpoint = "\(StringConstants.baseAppUrl)\(StringConstants.resultCountEndpoint)\(result)"
        
        guard let url = URL(string: endpoint) else {
            throw RULocalisedError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RULocalisedError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(RandomUser.self, from: data)
        } catch{
            throw RULocalisedError.invalidData
        }
    }
}
