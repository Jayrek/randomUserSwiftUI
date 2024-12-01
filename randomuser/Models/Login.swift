//
//  Login.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

struct Login: Codable {
    let uuid, username, password: String
    let salt, md5, sha1, sha256: String
}

