//
//  Translation.swift
//  tictactoe
//
//  Created by Persilos on 25/04/2021.
//

import Foundation

class Translation {
    class general {
        static let ok = "general_ok".localized
    }
    
    class gameBoard {
        static let nextPlayer = "gameboard_nextplayer".localized
        static let title = "gameboard_title".localized
        static let startNewGame = "gameboard_start_new_game".localized
        
        class victoryAlert {
            static let title = "gameboard_result_victory_title".localized
            static let message = "gameboard_result_victory_message".localized
        }
        
        class drawAlert {
            static let title = "gameboard_result_draw_title".localized
            static let message = "gameboard_result_draw_message".localized
        }
    }
    
    class player {
        static let cross = "player_cross".localized
        static let round = "player_round".localized
    }
}
