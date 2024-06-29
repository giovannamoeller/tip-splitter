//
//  TipCalculatorScreen.swift
//  TipSplitterUITests
//
//  Created by Giovanna Moeller on 28/06/24.
//

import XCTest
@testable import TipSplitter

class TipCalculatorScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var logoView: XCUIElement {
        return app.otherElements[ScreenIdentifier.LogoView.logoView.rawValue]
    }
    
    var totalAmountPerPersonValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
        // staticTexts refers to labels
    }
    
    var totalBillValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
    
    var billInputViewTextField: XCUIElement {
        return app.textFields[ScreenIdentifier.BillInputView.textField.rawValue]
    }
    
    var tipInputViewTenPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.tenPercentButton.rawValue]
    }
    
    var tipInputViewFifteenPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.fifteenPercentButton.rawValue]
    }
    
    var tipInputViewTwentyPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.twentyPercentButton.rawValue]
    }
    
    var tipInputViewCustomTipPercentButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.customPercentButton.rawValue]
    }
    
    var tipInputViewCustomTipAlertTextField: XCUIElement {
        return app.textFields[ScreenIdentifier.TipInputView.customTipAlertTextField.rawValue]
    }
    
    var splitInputViewDecrementButton: XCUIElement {
        return app.buttons[ScreenIdentifier.SplitInputView.decrementButton.rawValue]
    }
    
    var splitInputViewIncrementButton: XCUIElement {
        return app.buttons[ScreenIdentifier.SplitInputView.incrementButton.rawValue]
    }
    
    var splitInputViewQuantityValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.SplitInputView.quantityValueLabel.rawValue]
    }
    
    func enterBill(amount: Double) {
        billInputViewTextField.tap()
        billInputViewTextField.typeText("\(amount)\n")
    }
    
    // Actions
    
    func selectTip(tip: Tip) {
        switch tip {
        case .tenPercent:
            tipInputViewTenPercentButton.tap()
        case .fifteenPercent:
            tipInputViewFifteenPercentButton.tap()
        case .twentyPercent:
            tipInputViewTwentyPercentButton.tap()
        case .custom(let value):
            tipInputViewCustomTipPercentButton.tap()
            XCTAssertTrue(tipInputViewCustomTipAlertTextField.waitForExistence(timeout: 2.0))
            tipInputViewCustomTipAlertTextField.typeText("\(value)\n")
        case .none:
            break
        }
    }
    
    func selectDecrementButton(numberOfTaps: Int) {
        splitInputViewDecrementButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func selectIncrementButton(numberOfTaps: Int) {
        splitInputViewIncrementButton.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: 1)
    }
    
    func doubleTapLogoView() {
        logoView.tap(withNumberOfTaps: 2, numberOfTouches: 1)
    }
}
