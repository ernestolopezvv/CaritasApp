//
//  CaritasAppUITests.swift
//  CaritasAppUITests
//
//  Created by Ernesto López on 09/09/21.
//

import XCTest
@testable import CaritasApp


class testIDS34_Chofer_Button: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    
    // Funcionalidad del Boton IDS34_login te lleva a IDS35C
    func test_screen_is_displayed(){
        
        let app = XCUIApplication()
        app.launch()
        
        let addTaskButton = app.buttons["Chofer"]
        addTaskButton.tap()
        
        let addTaskNavBartitle = app.staticTexts["Recolecciones"]
        XCTAssertTrue(addTaskNavBartitle.waitForExistence(timeout: 0.5))
        
    }
    
}

class testIDS35CTableView: XCTestCase {
    
    // Probar si te lleva correctamente de IDS34 -IDS35C - IDS16
    override func setUp() {
        XCUIApplication().launch()
    }
    
    
   
    func testRecoleccionesTableView(){
        
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["Chofer"]/*[[".buttons[\"Chofer\"].staticTexts[\"Chofer\"]",".staticTexts[\"Chofer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Sam"].tap()
        
    }
    
}


