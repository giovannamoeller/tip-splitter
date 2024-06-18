//
//  TipPercentageButton.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

enum Tip {
    case none
    case tenPercent
    case fifteenPercent
    case twentyPercent
    case custom(value: Int)
    
    var stringValue: String {
        switch self {
        case .none:
            return ""
        case .tenPercent:
            return "10%"
        case .fifteenPercent:
            return "15%"
        case .twentyPercent:
            return "20%"
        case .custom(let value):
            return String(value)
        }
    }
}

class TipPercentageButton: UIButton {
    
    private var tip: Tip
    
    init(tip: Tip) {
        self.tip = tip
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = ThemeColor.primaryColor
        tintColor = .white
        layer.cornerRadius = 8.0
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
