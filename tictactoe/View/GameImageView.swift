//
//  GameImage.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import UIKit

class GameImageView: UIImageView {
    
    override var alignmentRectInsets: UIEdgeInsets {
        return UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
    }
    
    func set(with box: Box) {
        if let tag = ImageBoardTag.imageTags.first(where: { tuple -> Bool in
            tuple.key == box.rawValue
        }) {
            self.tag = tag.idTag
        } else {
            fatalError("No UI tag found for this box")
        }
    }
    
    func getBox() -> Box {
        let idTag = self.tag
        
        if let tag = ImageBoardTag.imageTags.first(where: { tuple -> Bool in
            tuple.idTag == idTag
        }), let box = Box(rawValue: tag.key) {
            return box
        } else {
            fatalError("No Box found for UI tag")
        }
    }
}
