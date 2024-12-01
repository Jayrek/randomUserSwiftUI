//
//  RandomUserListViewModel.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

@MainActor
final class RandomUserListViewModel: ObservableObject {
    
    @Published var users: [Result] = []
    @Published var isLoading: Bool = false
    @Published var errorDescription: String = ""
    
    func getRandomUsers(result: String) async {
        do {
            self.errorDescription = ""
            isLoading = true
            
            let users = try await RandomUserService.getRandomUsers(result: result)
            
            self.users = users.results
            isLoading = false
        } catch(let error) {
            isLoading = false
            self.errorDescription = error.localizedDescription
        }
    }
}
