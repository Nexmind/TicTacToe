//
//  String+Extension.swift
//  tictactoe
//
//  Created by Persilos on 25/04/2021.
//

import Foundation

extension String {
    var localized:String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
