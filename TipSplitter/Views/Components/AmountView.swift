//
//  AmountView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

class AmountView: UIView {
    
    private var labelText: String
    private var amountValueText: String
    private var alignment: UIStackView.Alignment
    
    private lazy var totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = labelText
        label.font = ThemeFont.bodyRegular
        label.textColor = ThemeColor.textColor
        return label
    }()
    
    lazy var amountPerPersonLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: amountValueText,
            attributes: [
                .font: ThemeFont.titleBold
            ])
        text.addAttributes([
            .font: ThemeFont.bodyBold
        ], range: NSMakeRange(0, 1))
        label.attributedText = text
        label.textColor = ThemeColor.primaryColor
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalPerPersonLabel, amountPerPersonLabel])
        stackView.axis = .vertical
        stackView.alignment = alignment
        stackView.distribution = .fillEqually
        return stackView
    }()

    init(labelText: String, amountValueText: String, alignment: UIStackView.Alignment = .leading) {
        self.labelText = labelText
        self.amountValueText = amountValueText
        self.alignment = alignment
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.edges.equalToSuperview()
            constraintMaker.height.equalTo(64.0)
        }
    }
    
    func updateView(text: String) {
        let text = NSMutableAttributedString(
            string: text,
            attributes: [
                .font: ThemeFont.titleBold
            ])
        text.addAttributes([
            .font: ThemeFont.bodyBold
        ], range: NSMakeRange(0, 1))
        amountPerPersonLabel.attributedText = text
    }
    
}
