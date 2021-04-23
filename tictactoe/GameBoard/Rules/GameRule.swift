//
//  GameRule.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

typealias Combinaison = [Box]

/**
 This protocol represent the rule of the game that can be defined implementing the interface. The rule need to know the state of the game to apply rules succesfully
 */
protocol GameRule {
    var winningCombinaisons: [Combinaison] { get set }
    var players: [Player] { get }
    var firstPlayer: Player { get }
    var gameState: GameState { get set }
    
    init(gameState: GameState)
    
    func isWinning(with combinaison: Combinaison) -> Bool
    
    func canPlay(box: Box) -> Bool
    func play(box: Box) throws
    func changePlayer()
}

extension GameRule {
    func isWinning(with combinaison: Combinaison) -> Bool {
        for correctCombinaison in winningCombinaisons {
            let boxMatching = combinaison.filter { correctCombinaison.contains($0) }
            
            if boxMatching.count == correctCombinaison.count {
                return true
            }
        }
        return false
    }
}

enum GameRuleError: Error {
    case boxAlreadyPlayed
}
