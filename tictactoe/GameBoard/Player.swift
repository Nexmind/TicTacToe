//
//  Player.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation
import UIKit

enum Player {
    case cross
    case round
    
    func getColor() -> UIColor {
        switch(self) {
        case .cross:
            return .systemOrange
        default:
            return .systemBlue
        }
    }
    
    func getSymbol() -> UIImage {
        switch(self) {
        case .cross:
            return UIImage.cross
        default:
            return UIImage.round
        }
    }
    
    func localizedName() -> String {
        switch(self) {
        case .cross:
            return Translation.player.cross
        case .round:
            return Translation.player.round
        }
    }
}
