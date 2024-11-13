//
//  DataService.swift
//  Football Data API
//
//  Created by Antony Holshouser on 11/12/24.
//

import Foundation

struct DataService {
    
    func getData() async -> [Team] {
        //print("Start")
        
        if let url = URL(string: "https://api.football-data.org/v4/teams") {
            //print("Url")
            
            var request = URLRequest(url: url)
            request.addValue(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "", forHTTPHeaderField: "X-Auth-Token")
            //print("Request")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                //print("Session")
                
                let decoder = JSONDecoder()
                let teamlist = try decoder.decode(TeamList.self, from: data)
                //print("Decoder")
                
                //print(response)
                //print(teamlist)
                
                return teamlist.teams
            } catch {
                print(error)
            }
        }
        
        print("Default End")
        
        return [Team]()
    }
}
