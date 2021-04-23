//
//  ImageBoardTag.swift
//  tictactoe
//
//  Created by Persilos on 23/04/2021.
//

import Foundation

class ImageBoardTag {
    
    static let imageTags = [
        ImageBoardTag.topLeft, ImageBoardTag.topMiddle, ImageBoardTag.topRight,
        ImageBoardTag.centerLeft, ImageBoardTag.center, ImageBoardTag.centerRight,
        ImageBoardTag.bottomLeft, ImageBoardTag.bottomMiddle, ImageBoardTag.bottomRight
    ]
    
    fileprivate static let topLeft = (key: "topLeft", idTag: 2001)
    fileprivate static let topMiddle = (key: "topMiddle", idTag: 2002)
    fileprivate static let topRight = (key: "topRight", idTag: 2003)
    
    fileprivate static let centerLeft = (key: "centerLeft", idTag: 2004)
    fileprivate static let center = (key: "center", idTag: 2005)
    fileprivate static let centerRight = (key: "centerRight", idTag: 2006)
    
    fileprivate static let bottomLeft = (key: "bottomLeft", idTag: 2007)
    fileprivate static let bottomMiddle = (key: "bottomMiddle", idTag: 2008)
    fileprivate static let bottomRight = (key: "bottomRight", idTag: 2009)
}
