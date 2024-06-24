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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeColor.secondaryLighterColor
        addSubviews()
        setupConstraints()
        bind()
    }
    
    private func bind() {
        
        let input = TipCalculatorViewModel.Input(
            billPublisher: billInputView.valuePublisher,
            tipPublisher: tipInputView.valuePublisher,
            splitPublisher: splitInputView.valuePublisher)
        
        let output = viewModel.transform(input: input)
        
        output.updateViewPublisher.sink { result in
            self.tipResultView.updateView(result: result)
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

