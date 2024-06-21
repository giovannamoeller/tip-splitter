//
//  TipInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import Combine
import CombineCocoa

class TipInputView: UIView {
    
    private var tipSubject = CurrentValueSubject<Tip, Never>(.none)
    private var cancellables = Set<AnyCancellable>()
    
    var valuePublisher: AnyPublisher<Tip, Never> {
        return tipSubject.eraseToAnyPublisher()
    }
    
    private var headerLabelView = SplittedLabelView(topText: "Choose", bottomText: "your tip")
    
    private lazy var tenPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .tenPercent)
        button.tapPublisher.flatMap ({Just(Tip.tenPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var fifteenPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .fifteenPercent)
        button.tapPublisher.flatMap ({Just(Tip.fifteenPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var twentyPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .twentyPercent)
        button.tapPublisher.flatMap ({Just(Tip.twentyPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var customPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .custom)
        button.tapPublisher.flatMap ({Just(Tip.custom)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView, customPercentTipButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16.0
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tenPercentTipButton, fifteenPercentTipButton, twentyPercentTipButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16.0
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabelView)
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        headerLabelView.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.centerY.equalTo(verticalStackView.snp.centerY)
            constraintMaker.trailing.equalTo(verticalStackView.snp.leading).offset(-16.0)
            constraintMaker.width.equalTo(68)
        }
        
        verticalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.trailing.bottom.equalToSuperview()
        }
    }
    
}
