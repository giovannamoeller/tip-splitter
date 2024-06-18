//
//  TipPercentageButton.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

class TipPercentageButton: UIButton {
    
    private var tip: Tip
    
    init(tip: Tip) {
        self.tip = tip
        super.init(frame: .zero)
        setupLayout()
        setupTitle()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = ThemeColor.primaryColor
        tintColor = .white
        titleLabel?.textColor = .white
        layer.cornerRadius = 8.0
    }
    
    private func setupTitle() {
        if tip == .custom {
            setTitle(tip.stringValue, for: .normal)
            titleLabel?.font = ThemeFont.bodyBold
        } else {
            let text = NSMutableAttributedString(string: tip.stringValue,
                                                 attributes: [
                                                    .font: ThemeFont.titleBold
                                                 ])
            text.addAttributes([
                .font: ThemeFont.bodyBold
            ], range: NSMakeRange(2, 1))
            setAttributedTitle(text, for: .normal)
        }
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(56.0)
        }
    }

}
