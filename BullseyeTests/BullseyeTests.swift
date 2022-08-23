//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Mohamed Ahmed on 20/07/2022.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game : Game!

    override func setUpWithError() throws {
        
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    
    func pointsPositive() throws {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func pointsNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
