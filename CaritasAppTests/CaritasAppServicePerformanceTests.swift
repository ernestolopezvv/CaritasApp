//
//  CaritasAppServicePerformanceTests.swift
//  CaritasAppTests
//
//  Created by Ernesto López on 24/10/21.
//

import XCTest
@testable import CaritasApp

class CaritasAppServicePerformanceTests: XCTestCase {
    
    let APIFunc = APIFunctions.functions


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testDecodeDonations() throws {
        // This is an example of a performance test case.
        self.measure {
            APIFunc.fetchDonations()
        }
    }
    
    func testDecodeUsers() throws {
        // This is an example of a performance test case.
        self.measure {
            APIFunc.fetchDonators()
        }
    }
    
    func testDecodeProducts() throws {
        // This is an example of a performance test case.
        self.measure {
            APIFunc.fetchItems()
        }
    }

}
