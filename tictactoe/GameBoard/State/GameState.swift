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
    private(set) var currentPlayer: DynamicValue<Player> = DynamicValue(.cross)
    private(set) var status: DynamicValue<GameStatus> = DynamicValue(.inProgress)
    
    func reset() {
        self.combinaisonByPlayer.keys.forEach {
            combinaisonByPlayer.updateValue([], forKey: $0)
        }
        self.status.value = .inProgress
    }
    
    func set(players: [Player]) {
        players.forEach { player in
            self.combinaisonByPlayer.updateValue([], forKey: player)
        }
    }
    
    func getAllBoxsPlayed() -> [Box] {
        return self.combinaisonByPlayer.flatMap { $0.value }
    }
    
    func getCombinaison(by player: Player) throws -> Combinaison {
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
    
    func isGameFinish() -> Bool {
        return self.combinaisonByPlayer.flatMap { $0.value }.count == 9
    }
    
    func update(current currentPlayer: Player) {
        self.currentPlayer.value = currentPlayer
    }
    
    func update(status: GameStatus) {
        self.status.value = status
    }
}

enum GameStatus: Equatable {
    case inProgress
    case draw
    case unknown
    case winning(Player)
    
    static func ==(lhs: GameStatus, rhs: GameStatus) -> Bool {
        switch (lhs, rhs) {
        case (.inProgress, .inProgress):
            return true
        case (.draw, .draw):
            return true
        case (.unknown, .unknown):
            return true
        case (.winning(let playerLeft), .winning(let playerRight)):
            return playerLeft == playerRight
        default:
            return false
        }
    }
}

enum GameStateError: Error {
    case playerNotFound
}
