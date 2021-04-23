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
    var gameState: GameState
    
    var firstPlayer: Player = .cross
    
    required init(gameState: GameState) {
        self.gameState = gameState
        self.gameState.update(current: self.firstPlayer)
        self.gameState.set(players: self.players)
    }
    
    func canPlay(box: Box) -> Bool {
        return !self.gameState.getAllBoxsPlayed().contains(box)
    }
    
    func play(box: Box) throws {
        if canPlay(box: box) {
            try self.gameState.play(box: box, for: self.gameState.currentPlayer.value)
            let newCombinaison = try self.gameState.getCombinaison(by: self.gameState.currentPlayer.value)
            
            if self.isWinning(with: newCombinaison) {
                self.gameState.update(status: .winning(self.gameState.currentPlayer.value))
            } else if self.gameState.isGameFinish() {
                self.gameState.update(status: .draw)
            } else {
                self.changePlayer()
            }
        } else {
            throw GameRuleError.boxAlreadyPlayed
        }
    }
    
    func changePlayer() {
        let nextPlayer: Player = (self.gameState.currentPlayer.value == .cross) ? .round : .cross
        self.gameState.update(current: nextPlayer)
    }
}
