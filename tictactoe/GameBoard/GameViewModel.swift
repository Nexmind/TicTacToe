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
    
    init() {
        self.state = GameState()
        self.rule = ClassicRule(gameState: self.state)
    }
    
    func reset() {
        self.state.reset()
    }
    
    func play(box: Box, player: Player) throws {
        try self.rule.play(box: box, for: player)
    }
}
