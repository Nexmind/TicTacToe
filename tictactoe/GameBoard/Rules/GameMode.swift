//
//  GameMode.swift
//  tictactoe
//
//  Created by Persilos on 25/04/2021.
//

import Foundation

enum GameMode {
    case classic
    
    func getRule(using state: GameState) -> GameRule {
        switch(self) {
        case .classic:
            return ClassicRule(gameState: state)
        }
    }
}
