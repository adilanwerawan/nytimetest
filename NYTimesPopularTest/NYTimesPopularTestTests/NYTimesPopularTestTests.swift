//
//  NYTimesPopularTestTests.swift
//  NYTimesPopularTestTests
//
//  Created by Adil Anwer on 9/22/19.
//  Copyright © 2019 Adil Anwer. All rights reserved.
//

import XCTest
@testable import NYTimesPopularTest

class NYTimesPopularTestTests: XCTestCase {

    var viewController: NyHomeVC!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "NyHomeVC") as? NyHomeVC
        viewController.beginAppearanceTransition(true, animated: false)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
//        viewController.endAppearanceTransition()
//        viewController = nil
    }

    func testHomeNyListingTable() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
     
        
        XCTAssertNotNil(viewController.nyArticlesTable, "table view should not be nil please check if its outlet connected")
        
    }

    func testNyHomeCellNotNil() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let cell = viewController.nyArticlesTable?.dequeueReusableCell(withIdentifier: CellIds.NyHomeCellId.rawValue)
        
        XCTAssertNotNil(cell, "table view should be able to deque cell with id \(CellIds.NyHomeCellId.rawValue)")
        
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
