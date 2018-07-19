//
//  PlayerController.swift
//  Statcenter
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class PlayerController {
// http://api.suredbits.com/sport/version/searchParameter/subParameters

    static let baseURL = URL(string: "http://api.suredbits.com/nfl")!
    
    static func getPlayers(searchText: String, completion: @escaping ((Player?) -> Void)) {
        
        let searchTextArray = searchText.lowercased().components(separatedBy: " ")
        let firstName = searchTextArray[0]
        let lastName = searchTextArray[1]
        
        var appendedURL = baseURL

        appendedURL.appendPathComponent("v0")
        appendedURL.appendPathComponent("players")
        appendedURL.appendPathComponent(lastName)
        appendedURL.appendPathComponent(firstName)
        print(appendedURL)
        URLSession.shared.dataTask(with: appendedURL) { (data, _, error) in
            if let error = error {
                print("Error occurred retrieving data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return }
            
            do {
                guard let playerArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else { completion(nil); return }
                let player = Player(playersArray: playerArray)
                completion(player)
                print(player)
            } catch {
                print("Error decoding player: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}

