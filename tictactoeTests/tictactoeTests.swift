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
        self.gameViewModel = GameViewModel(gameMode: .classic)
    }

    override func tearDownWithError() throws {
        // Reset the game before each test
        self.gameViewModel.reset()
    }

    func testPlayerShouldntPlayOnAlreadyPlayedBox() throws {
        try self.gameViewModel.play(box: .bottomLeft)
        XCTAssertThrowsError(try self.gameViewModel.play(box: .bottomLeft))
    }
    
    func testPlayerShouldntPlayTwoTimeInARow() throws {
        let currentPlayer = self.gameViewModel.currentPlayer.value
        try self.gameViewModel.play(box: .bottomLeft)
        let nextPlayer = self.gameViewModel.currentPlayer.value
        
        XCTAssertTrue(currentPlayer != nextPlayer)
    }
    
    func testFirstPlayerIsCross() throws {
        XCTAssertTrue(self.gameViewModel.currentPlayer.value == .cross)
    }
    
    func testCrossPlayerWinWithHorizontal1() throws {
        // Cross then round
        try self.gameViewModel.play(box: .bottomLeft)
        try self.gameViewModel.play(box: .topLeft)
        
        // Cross then round
        try self.gameViewModel.play(box: .bottomMiddle)
        try self.gameViewModel.play(box: .topMiddle)
        
        // Cross
        try self.gameViewModel.play(box: .bottomRight)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithHorizontal2() throws {
        // Cross then round
        try self.gameViewModel.play(box: .centerLeft)
        try self.gameViewModel.play(box: .topLeft)
        
        // Cross then round
        try self.gameViewModel.play(box: .center)
        try self.gameViewModel.play(box: .topMiddle)
        
        // Cross
        try self.gameViewModel.play(box: .centerRight)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithHorizontal3() throws {
        // Cross then round
        try self.gameViewModel.play(box: .topLeft)
        try self.gameViewModel.play(box: .bottomLeft)
        
        // Cross then round
        try self.gameViewModel.play(box: .topMiddle)
        try self.gameViewModel.play(box: .bottomMiddle)
        
        // Cross
        try self.gameViewModel.play(box: .topRight)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithVertical1() throws {
        // Cross then round
        try self.gameViewModel.play(box: .bottomLeft)
        try self.gameViewModel.play(box: .bottomMiddle)
        
        // Cross then round
        try self.gameViewModel.play(box: .centerLeft)
        try self.gameViewModel.play(box: .center)
        
        // Cross
        try self.gameViewModel.play(box: .topLeft)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithVertical2() throws {
        // Cross then round
        try self.gameViewModel.play(box: .bottomRight)
        try self.gameViewModel.play(box: .bottomMiddle)
        
        // Cross then round
        try self.gameViewModel.play(box: .centerRight)
        try self.gameViewModel.play(box: .center)
        
        // Cross
        try self.gameViewModel.play(box: .topRight)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithVertical3() throws {
        // Cross then round
        try self.gameViewModel.play(box: .bottomMiddle)
        try self.gameViewModel.play(box: .bottomLeft)
        
        // Cross then round
        try self.gameViewModel.play(box: .center)
        try self.gameViewModel.play(box: .centerLeft)
        
        // Cross
        try self.gameViewModel.play(box: .topMiddle)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithDiagonal1() throws {
        // Cross then round
        try self.gameViewModel.play(box: .topRight)
        try self.gameViewModel.play(box: .bottomMiddle)
        
        // Cross then round
        try self.gameViewModel.play(box: .center)
        try self.gameViewModel.play(box: .centerRight)
        
        // Cross
        try self.gameViewModel.play(box: .bottomLeft)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testCrossPlayerWinWithDiagonal2() throws {
        // Cross then round
        try self.gameViewModel.play(box: .topLeft)
        try self.gameViewModel.play(box: .bottomMiddle)
        
        // Cross then round
        try self.gameViewModel.play(box: .center)
        try self.gameViewModel.play(box: .centerRight)
        
        // Cross
        try self.gameViewModel.play(box: .bottomRight)
        
        switch (self.gameViewModel.gameStatus.value) {
        case .winning(let player):
            XCTAssertTrue(player == .cross)
        default:
            break
        }
    }
    
    func testGameIsTerminatedWithoutWinner() throws {
        // X
        try self.gameViewModel.play(box: .topLeft)
        // O
        try self.gameViewModel.play(box: .topRight)
        // X
        try self.gameViewModel.play(box: .topMiddle)
        
        // O
        try self.gameViewModel.play(box: .centerLeft)
        // X
        try self.gameViewModel.play(box: .centerRight)
        // O
        try self.gameViewModel.play(box: .center)
        
        // X
        try self.gameViewModel.play(box: .bottomLeft)
        // O
        try self.gameViewModel.play(box: .bottomRight)
        // X
        try self.gameViewModel.play(box: .bottomMiddle)

        XCTAssertTrue(self.gameViewModel.gameStatus.value == .draw)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
