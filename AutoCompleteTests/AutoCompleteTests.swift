//
//  AutoCompleteTests.swift
//  AutoCompleteTests
//
//  Created by Michael Kofman on 2/10/18.
//  Copyright © 2018 Michael Kofman. All rights reserved.
//

import XCTest
@testable import AutoComplete

class AutoCompleteTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAll(){
        let mockAnimalRepo = MockAnimalRepository()
        mockAnimalRepo.write(model: Animal(name: "Giraffe"))
        
        let useCase = LoadAnimalNames()
        useCase.animalRepository = mockAnimalRepo
        
        let repoContent = mockAnimalRepo.getAll()
        XCTAssert(repoContent.count == 1)
        XCTAssert(repoContent[0].name == "Giraffe")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
