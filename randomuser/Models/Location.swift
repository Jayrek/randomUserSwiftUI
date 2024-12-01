//
//  Location.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import Foundation

struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
}
