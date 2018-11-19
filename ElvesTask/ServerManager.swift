//
//  TaskManagerTest.swift
//  ElvesTaskTests
//
//  Created by BinaryBoy on 11/19/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Quick
import Nimble
import RxSwift

@testable import ElvesTask

class TaskManagerTest: QuickSpec {
    
    override func spec() {
        
        describe("LoginManager") {
            beforeEach {
                self.server = LogManager
            }
            context("Test number of tasks from API"){
                it("expect get tasks not empty array"){
                    TasksManagerClient.getTasks().subscribe(onNext: { result in
                        expect(result.first.tasks.count) > 0
                    }, onError: { error in
                      print(error)
                    })
                    
                }
            }
            
        }
    }
}
