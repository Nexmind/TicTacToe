//
//  GameViewModel.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

class GameViewModel: NSObject {
    
    let rule: GameRule
    private let state: GameState
    
    var currentPlayer: DynamicValue<Player>
    
    var gameStatus: DynamicValue<GameStatus>
    
    override init() {
        self.state = GameState()
        self.rule = ClassicRule(gameState: self.state)
        
        self.currentPlayer = DynamicValue(.cross)
        self.gameStatus = DynamicValue(.unknown)
        
        super.init()
        
        self.state.currentPlayer.addAndNotify(observer: self) {
            self.currentPlayer.value = self.state.currentPlayer.value
        }
        
        self.state.status.addAndNotify(observer: self) {
            self.gameStatus.value = self.state.status.value
        }
        
    }
    
    func reset() {
        self.state.reset()
        self.state.update(current: self.rule.firstPlayer)
    }
    
    /**
        Play if possible. If success, the current player is automatically changed
     */
    func play(box: Box) throws {
        try self.rule.play(box: box)
    }
}
