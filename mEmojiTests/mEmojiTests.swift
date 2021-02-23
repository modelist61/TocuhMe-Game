//
//  mEmojiTests.swift
//  mEmojiTests
//
//  Created by Dmitry Tokarev on 31.01.2021.
//

import XCTest
@testable import mEmoji

class mEmojiTests: XCTestCase {
    
    var sut: TouchMe!

    override func setUp() {
        super.setUp()
        sut = TouchMe()
    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }

    func testExample() {
       
    }

    func testPerformanceExample() throws {
        
        measure {
        }
    }

}
