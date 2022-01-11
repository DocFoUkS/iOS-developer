//
//  Game.swift
//  NBAPlayers
//
//  Created by Евгений Матвеев on 27.08.2021.
//

import Foundation

struct GameResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    let date: String
    let season: String
    let status: String
    let period: String

    let hometeamscore: Int?
    let visitorteamscore: Int?
    let hometeam: Team
    let visitorteam: Team
    
    var GameDate: String {
        return "Season " + season + " game date " + date
    }

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case season = "season"
        case status = "status"
        case period = "period"
        case hometeamscore = "home_team_score"
        case visitorteamscore = "visitor_team_score"
        case hometeam = "home_team"
        case visitorteam = "visitor_team"
    }
}
