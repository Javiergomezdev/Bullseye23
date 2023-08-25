//
//  Game.swift
//  Bullseye23
//
//  Created by Javier Gomez on 18/07/23.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(score: 100)
            addToLeaderboard(score: 80)
            addToLeaderboard(score: 200)
            addToLeaderboard(score: 50)
            addToLeaderboard(score: 20)
        }
    }
        func points(sliderValue: Int) -> Int {
            let difference = abs(target - sliderValue)
            let bonus: Int
            if difference == 0 {
                bonus = 100
            }else if difference <= 2 {
                bonus = 50
            }else {
                bonus = 0
            }
            return 100 - difference + bonus
            //reduccion de codigo de las siguientes lineas en 1 sola linea incluso no hace falta el return
            //let difference: Int = abs(target - sliderValue)
            //con esta funcion nos ahorramos las siguientes opciones opteniendo lo mismo
            //   if difference < 0 {
            //   difference = difference * -1
            // o difference *= -1
            // o difference = -difference  }
            // let awardedPoints = 100 - difference
            // return awardedPoints
            
        }
        mutating func startNewRound(points: Int) {
            //score = score + points
            addToLeaderboard(score: points)
            score += points
            round += 1
            target = Int.random(in: 1...100)
        }
        mutating func restart() {
            score = 0
            round = 1
            target = Int.random(in: 1...100)
        }
        
        mutating func addToLeaderboard(score: Int) {
            leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
            leaderboardEntries.sort { entry1, entry2 in
                entry1.score > entry2.score
            }
        }
    }
    
    struct LeaderboardEntry {
        let score: Int
        let date: Date
    }

