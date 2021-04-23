//
//  ClassicRule.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

/**
    Classic implementation of the Tic Tac Toe rules
 */
class ClassicRule: GameRule {
    var winningCombinaisons: [Combinaison] = [
        // Horizontal
        [.topLeft, .topMiddle, .topRight],
        [.centerLeft, .center, .centerRight],
        [.bottomLeft, .bottomMiddle, .bottomRight],
        
        // Vertical
        [.topLeft, .centerLeft, .bottomLeft],
        [.topMiddle, .center, .bottomMiddle],
        [.topRight, .centerRight, .bottomRight],
        
        // Diagonal
        [.topLeft, .center, .bottomRight],
        [.topRight, .center, .bottomLeft]
    ]
    
    let players: [Player] = [.cross, .round]
    var currentPlayer: Player = .cross
    var gameState: GameState
    
    required init(gameState: GameState) {
        self.gameState = gameState
        self.gameState.set(players: self.players)
    }
    
    func canPlay(box: Box) -> Bool {
        return !self.gameState.getAllBoxsPlayed().contains(box)
    }
    
    func play(box: Box, for player: Player) throws {
        if canPlay(box: box) {
            try self.gameState.play(box: box, for: player)
            self.changePlayer()
        } else {
            throw GameRuleError.boxAlreadyPlayed
        }
    }
    
    func changePlayer() {
        self.currentPlayer = currentPlayer == .cross ? .round : .cross
    }
}
