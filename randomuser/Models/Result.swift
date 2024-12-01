//
//  Result.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

struct Result: Codable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: Id
    let picture: Picture
    let nat: String 
}
