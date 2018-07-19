//
//  Player.swift
//  Statcenter
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

struct Player {
    
    // MARK: - Properties
    let name: String
    let number: Int
    let team: String
    let college: String
    let position: String
    let height: Int
    let weight: Int
    
    // MARK: - Initializers
    init?(playersArray: [[String : Any]]?) {
        guard let resultsDictionary = playersArray?[0],
            let name = resultsDictionary[CodingKeys.name.rawValue] as? String,
            let number = resultsDictionary[CodingKeys.number.rawValue] as? Int,
            let team = resultsDictionary[CodingKeys.team.rawValue] as? String,
            let college = resultsDictionary[CodingKeys.college.rawValue] as? String,
            let position = resultsDictionary[CodingKeys.position.rawValue] as? String,
            let height = resultsDictionary[CodingKeys.height.rawValue] as? Int,
            let weight = resultsDictionary[CodingKeys.weight.rawValue] as? Int else { return nil }
        
        self.name = name
        self.number = number
        self.team = team
        self.college = college
        self.position = position
        self.height = height
        self.weight = weight
    }

    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case name = "fullName"
        case team
        case number = "uniformNumber"
        case college
        case position
        case height
        case weight
    }
    
}
