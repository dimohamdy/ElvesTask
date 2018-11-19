//
//  TaskManagerTest.swift
//  ElvesTaskTests
//
//  Created by BinaryBoy on 11/19/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import XCTest
import RxSwift

@testable import ElvesTask

class TaskManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        let disposeBag = DisposeBag()
//        let expectUpdateSubmitButtonStateCall = expectation(description:"updateSubmitButtonState is called")
//
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        TasksManagerClient.compelteTask(taskId: 1).subscribe(onNext: { complete in
//            XCTAssertTrue(complete)
//        }).disposed(by: disposeBag)
//        wait(for: [expectUpdateSubmitButtonStateCall], timeout:0.1)
//
//    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
