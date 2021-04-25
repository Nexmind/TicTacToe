//
//  GameViewModel.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

class GameViewModel: NSObject {
    
    var rule: GameRule
    private let state: GameState
    
    var currentPlayer: DynamicValue<Player>
    
    var gameStatus: DynamicValue<GameStatus>
    
    private override init() {
        self.state = GameState()
        self.rule = ClassicRule(gameState: self.state)
        
        self.currentPlayer = DynamicValue(.cross)
        self.gameStatus = DynamicValue(.unknown)
    }
    
    required convenience init(gameMode: GameMode) {
        self.init()
        self.rule = gameMode.getRule(using: self.state)
        
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
