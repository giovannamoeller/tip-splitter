//
//  TipCalculatorViewController.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import SnapKit
import Combine

class TipCalculatorViewController: UIViewController {
    
    private var logoView = LogoView()
    private var tipResultView = TipResultView()
    private var billInputView = BillInputView()
    private var tipInputView = TipInputView()
    private var splitInputView = SplitInputView()
    
    private var viewModel = TipCalculatorViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoView, tipResultView, billInputView, tipInputView, splitInputView])
        stackView.axis = .vertical
        stackView.spacing = 36.0
        return stackView
    }()
    
    private lazy var viewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        view.addGestureRecognizer(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()
    
    private lazy var logoViewTapPublisher: AnyPublisher<Void, Never> = {
        let tapGesture = UITapGestureRecognizer(target: self, action: nil)
        tapGesture.numberOfTapsRequired = 2
        logoView.addGestureRecognizer(tapGesture)
        return tapGesture.tapPublisher.flatMap { _ in
            Just(())
        }.eraseToAnyPublisher()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeColor.secondaryLighterColor
        addSubviews()
        setupConstraints()
        bind()
        observe()
    }
    
    private func bind() {
        
        let input = TipCalculatorViewModel.Input(
            billPublisher: billInputView.valuePublisher,
            tipPublisher: tipInputView.valuePublisher,
            splitPublisher: splitInputView.valuePublisher,
            logoViewTapPublisher: logoViewTapPublisher)
        
        let output = viewModel.transform(input: input)
        
        output.updateViewPublisher.sink { result in
            self.tipResultView.updateView(result: result)
        }.store(in: &cancellables)
        
        output.resetCalculatorPublisher.sink { [unowned self] _ in
            billInputView.reset()
            tipInputView.reset()
            splitInputView.reset()
        }.store(in: &cancellables)
    }
    
    func observe() {
        viewTapPublisher.sink { _ in
            self.view.endEditing(true)
        }.store(in: &cancellables)
        
        logoViewTapPublisher.sink { _ in
            print("logo view")
        }.store(in: &cancellables)
    }
    
    private func addSubviews() {    
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.equalTo(view.snp.topMargin).offset(-16.0)
            constraintMaker.leading.equalTo(view.snp.leadingMargin).offset(16)
            constraintMaker.trailing.equalTo(view.snp.trailingMargin).offset(-16)
        }
        
        logoView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(64.0)
        }
        
        tipResultView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(220.0)
        }
        
        tipInputView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(120.0)
        }
        
        splitInputView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(60.0)
        }
        
        billInputView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(60.0)
        }
    }
}

