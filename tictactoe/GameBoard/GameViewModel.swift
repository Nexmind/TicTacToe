//
//  GameViewModel.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

class GameViewModel {
    
    let rule: GameRule
    private let state: GameState
    
    var currentPlayer: Player {
        return state.currentPlayer
    }
    
    var gameStatus: GameStatus {
        return self.state.status
    }
    
    init() {
        self.state = GameState()
        self.rule = ClassicRule(gameState: self.state)
    }
    
    func reset() {
        self.state.reset()
    }
    
    func play(box: Box) throws {
        try self.rule.play(box: box)
    }
}
