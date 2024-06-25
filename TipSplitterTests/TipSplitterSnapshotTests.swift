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
    
    func testInitialBillInputView() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = BillInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialTipInputView() {
        let size = CGSize(width: screenWidth, height: 120.0)
        let view = TipInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
    
    func testInitialSplitInputView() {
        let size = CGSize(width: screenWidth, height: 60.0)
        let view = SplitInputView()
        assertSnapshot(of: view, as: .image(size: size))
    }
}
