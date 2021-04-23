//
//  GameState.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

/**
    This class represent the state of the game. The state is different from the rule and no need to know the rule
 */
class GameState {
    
    private var combinaisonByPlayer: [Player: Combinaison] = [:]
    
    func reset() {
        self.combinaisonByPlayer = [:]
    }
    
    func set(players: [Player]) {
        players.forEach { player in
            self.combinaisonByPlayer.updateValue([], forKey: player)
        }
    }
    
    func getAllBoxsPlayed() -> [Box] {
        return self.combinaisonByPlayer.flatMap { $0.value }
    }
    
    private func getCombinaison(by player: Player) throws -> Combinaison {
        if let combinaison = self.combinaisonByPlayer[player] {
            return combinaison
        }
        throw GameStateError.playerNotFound
    }
    
    func play(box: Box, for player: Player) throws {
        var combinaison = try self.getCombinaison(by: player)
        combinaison.append(box)
        self.combinaisonByPlayer.updateValue(combinaison, forKey: player)
    }
}

enum GameStateError: Error {
    case playerNotFound
}
