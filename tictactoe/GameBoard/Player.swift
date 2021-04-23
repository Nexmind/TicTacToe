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
    
    func getSymbol() -> UIImage {
        switch(self) {
        case .cross:
            return UIImage.cross
        default:
            return UIImage.round
        }
    }
}
