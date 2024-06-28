//
//  TipSplitterUITests.swift
//  TipSplitterUITests
//
//  Created by Giovanna Moeller on 17/06/24.
//

import XCTest
import TipSplitter

final class TipSplitterUITests: XCTestCase {

    private var app: XCUIApplication!
    private var screen: TipCalculatorScreen {
        return TipCalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testResultViewDefaultValues() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "$0")
        XCTAssertEqual(screen.totalBillValueLabel.label, "$0")
        XCTAssertEqual(screen.totalTipValueLabel.label, "$0")
    }
}
