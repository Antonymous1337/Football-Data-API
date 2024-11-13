//
//  Team.swift
//  Football Data API
//
//  Created by Antony Holshouser on 11/12/24.
//

import Foundation

struct TeamList: Decodable {
    var teams = [Team]()
    
    enum CodingKeys: String, CodingKey {
        case teams
    }
}

struct Team: Decodable, Identifiable {
    let id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
