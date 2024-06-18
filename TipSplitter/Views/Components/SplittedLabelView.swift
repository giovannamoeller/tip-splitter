//
//  SplittedLabelView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

class SplittedLabelView: UIView {
    
    private var primaryText: String
    private var secondaryText: String
    
    private lazy var primaryTextLabel: UILabel = {
        let label = UILabel()
        label.text = primaryText
        label.textColor = ThemeColor.textColor
        label.font = ThemeFont.bodyBold
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondaryTextLabel: UILabel = {
        let label = UILabel()
        label.text = secondaryText
        label.textColor = ThemeColor.textColor
        label.font = ThemeFont.bodyRegular
        label.textAlignment = .left
        return label
    }()

    init(primaryText: String, secondaryText: String) {
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(primaryTextLabel)
        addSubview(secondaryTextLabel)
    }
    
    private func setupConstraints() {
        primaryTextLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.top.equalToSuperview()
        }
        
        secondaryTextLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.top.equalTo(primaryTextLabel.snp.bottom)
        }
    }
    
}
