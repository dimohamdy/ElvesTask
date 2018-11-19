//
//  ElvesTaskTests.swift
//  ElvesTaskTests
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
@testable import ElvesTask

class ElvesTaskTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDateToSting() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dateStringBefoure = "2018-11-06T11:25:27+02:00"
        
        let date:Date = DateConverter.convertToDate(string: dateStringBefoure) ?? Date()
        
        let dateStringAfter =  DateConverter.convertToString(date: date)
        XCTAssertEqual("Tue, 6 Nov 2018", dateStringAfter)
    }
    
    
    func testDateToDay() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dateStringBefoure = "2018-11-06T11:25:27+02:00"
        
        let date:Date = DateConverter.convertToDate(string: dateStringBefoure) ?? Date()
        
        
        let day =  DateConverter.getDayName(date: date)
        XCTAssertEqual("Tuesday", day)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
