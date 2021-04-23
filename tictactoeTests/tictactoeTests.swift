//
//  tictactoeTests.swift
//  tictactoeTests
//
//  Created by Persilos on 23/04/2021.
//

import XCTest
@testable import tictactoe

class tictactoeTests: XCTestCase {

    var gameViewModel: GameViewModel!
    
    override func setUpWithError() throws {
        self.gameViewModel = GameViewModel()
    }

    override func tearDownWithError() throws {
        // Reset the game before each test
        self.gameViewModel.reset()
    }

    func testPlayerShouldntPlayOnAlreadyPlayedBox() throws {
        try self.gameViewModel.play(box: .bottomLeft, player: .cross)
        XCTAssertThrowsError(try self.gameViewModel.play(box: .bottomLeft, player: .round)) 
    }
    
    func testPlayerShouldntPlayTwoTimeInARow() throws {
        
    }
    
    func testPlayerIsWinning() throws {
    
    }
    
    func testGameIsTerminatedWithoutWinner() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
