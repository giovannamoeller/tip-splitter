//
//  TipSplitterTests.swift
//  TipSplitterTests
//
//  Created by Giovanna Moeller on 17/06/24.
//

import XCTest
import Combine
@testable import TipSplitter

final class TipSplitterTests: XCTestCase {
    
    // SUT: System Under Test
    private var sut: TipCalculatorViewModel!
    private var cancellables: Set<AnyCancellable>!
    
    private let logoViewTapSubject = PassthroughSubject<Void, Never>()
    
    func testResultWithoutTipForOnePerson() {
        // Given:
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 1
        
        // When:
        let output = sut.transform(input: buildInput(bill: bill,
                                                     tip: tip,
                                                     split: split))
        
        // Then:
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: &cancellables)
    }
    
    func testResultWithoutTipForTwoPeople() {
        // Given:
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 2
        
        // When:
        let output = sut.transform(input: buildInput(bill: bill,
                                                     tip: tip,
                                                     split: split))
        
        // Then:
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 50)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: &cancellables)
    }
    
    func testResultWith10PercentTipForTwoPeople() {
        // Given:
        let bill: Double = 100.0
        let tip: Tip = .tenPercent
        let split: Int = 2
        
        // When:
        let output = sut.transform(input: buildInput(bill: bill,
                                                     tip: tip,
                                                     split: split))
        
        // Then:
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 55)
            XCTAssertEqual(result.totalBill, 110)
            XCTAssertEqual(result.totalTip, 10)
        }.store(in: &cancellables)
    }
    
    func testResultWithCustomTipForFourPeople() {
        // Given:
        let bill: Double = 300.0
        let tip: Tip = .custom(value: 30)
        let split: Int = 4
        
        // When:
        let output = sut.transform(input: buildInput(bill: bill,
                                                     tip: tip,
                                                     split: split))
        
        // Then:
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 97.5)
            XCTAssertEqual(result.totalBill, 390)
            XCTAssertEqual(result.totalTip, 90)
        }.store(in: &cancellables)
    }
    
    func testCalculatorResetOnLogoViewTap() {
        // Given:
        let bill: Double = 100.0
        let tip: Tip = .none
        let split: Int = 1
        
        let output = sut.transform(input: buildInput(bill: bill,
                                                     tip: tip,
                                                     split: split))
        let expectation1 = XCTestExpectation(description: "reset calculator called")
        // Then:
        output.resetCalculatorPublisher.sink { _ in
            expectation1.fulfill()
        }.store(in: &cancellables)
        
        // When:
        logoViewTapSubject.send()
        wait(for: [expectation1], timeout: 1.0)
    }
    
    private func buildInput(bill: Double, tip: Tip, split: Int) -> TipCalculatorViewModel.Input {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            logoViewTapPublisher: logoViewTapSubject.eraseToAnyPublisher())
    }

    override func setUp() {
        sut = .init()
        cancellables = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }
}
