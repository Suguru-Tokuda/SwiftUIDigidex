//
//  DigidexSwiftUIUITests.swift
//  DigidexSwiftUIUITests
//
//  Created by Suguru Tokuda on 11/20/23.
//

import XCTest

final class DigidexSwiftUIUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testLoginTextFields() throws {
        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("suguru@gmail.com")
        
        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("adfjaslgjhaslfjdlasjflasdjflasdjflasj123412341233412")
        app.typeText("\n")
        
        let loginBtn = app.buttons["loginBtn"]
                
        loginBtn.tap()
        
        let koromonText = app.staticTexts["Koromon"]
        XCTAssert(koromonText.waitForExistence(timeout: 10.0))
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
