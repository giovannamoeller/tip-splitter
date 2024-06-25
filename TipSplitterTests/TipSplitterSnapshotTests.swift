//
//  TipSplitterSnapshotTests.swift
//  TipSplitterTests
//
//  Created by Giovanna Moeller on 25/06/24.
//

import XCTest
import SnapshotTesting
@testable import TipSplitter

final class TipSplitterSnapshotTests: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func testLogoView() {
        // Given:
        let size = CGSize(width: screenWidth, height: 64.0)
        
        // When:
        let view = LogoView()
        
        // Then:
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialResultView() {
        let size = CGSize(width: screenWidth, height: 220.0)
        let view = TipResultView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testResultViewWithValues() {
        let size = CGSize(width: screenWidth, height: 220.0)
        let result = Result(amountPerPerson: 150.0,
                            totalBill: 300.0,
                            totalTip: 0)
        
        let view = TipResultView()
        view.updateView(result: result)
        
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialBillInputView() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = BillInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testBillInputViewWithValues() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = BillInputView()
        let textField = view.allSubViewsOf(type: UITextField.self).first
        textField?.text = "500"
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialTipInputView() {
        let size = CGSize(width: screenWidth, height: 120.0)
        let view = TipInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testTipInputViewWithValues() {
        let size = CGSize(width: screenWidth, height: 120.0)
        let view = TipInputView()
        let button = view.allSubViewsOf(type: UIButton.self).first
        button?.sendActions(for: .touchUpInside)
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialSplitInputView() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = SplitInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testSplitInputViewWithValues() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = SplitInputView()
        let button = view.allSubViewsOf(type: UIButton.self).last
        button?.sendActions(for: .touchUpInside)
        assertSnapshot(of: view, as: .image(size: size))
    }
}
