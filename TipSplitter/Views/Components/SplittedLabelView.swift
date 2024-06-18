//
//  SplittedLabelView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

class SplittedLabelView: UIView {
    
    private var topText: String
    private var bottomText: String
    
    private lazy var topTextLabel: UILabel = {
        let label = UILabel()
        label.text = topText
        label.textColor = ThemeColor.textColor
        label.font = ThemeFont.bodyBold
        label.textAlignment = .left
        return label
    }()
    
    private lazy var bottomTextLabel: UILabel = {
        let label = UILabel()
        label.text = bottomText
        label.textColor = ThemeColor.textColor
        label.font = ThemeFont.bodyRegular
        label.textAlignment = .left
        return label
    }()

    init(topText: String, bottomText: String) {
        self.topText = topText
        self.bottomText = bottomText
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(topTextLabel)
        addSubview(bottomTextLabel)
    }
    
    private func setupConstraints() {
        topTextLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.centerY.equalToSuperview().offset(-12.0)
        }
        
        bottomTextLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.top.equalTo(topTextLabel.snp.bottom)
        }
    }
    
}
