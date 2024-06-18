//
//  TipInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class TipInputView: UIView {
    
    private var headerLabelView = SplittedLabelView(topText: "Choose", bottomText: "your tip")
    private var tenPercentTipButton = TipPercentageButton(tip: .tenPercent)
    private var fifteenPercentTipButton = TipPercentageButton(tip: .fifteenPercent)
    private var twentyPercentTipButton = TipPercentageButton(tip: .twentyPercent)
    private var customTipButton = TipPercentageButton(tip: .custom)
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView, customTipButton])
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
