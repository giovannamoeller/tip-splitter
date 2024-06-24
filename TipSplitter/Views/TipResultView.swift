//
//  TipResultView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class TipResultView: UIView {
    
    private var totalBillView = AmountView(labelText: "Total bill", amountValueText: 0.0.currencyFormatted)
    private var totalTipView = AmountView(labelText: "Total tip", amountValueText: 0.0.currencyFormatted, alignment: .trailing)
    
    private lazy var totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.font = ThemeFont.bodyBold
        label.textColor = ThemeColor.textColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var amountPerPersonLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: 0.0.currencyFormatted,
            attributes: [
                .font: ThemeFont.largeTitleBold
            ])
        text.addAttributes([
            .font: ThemeFont.titleBold
        ], range: NSMakeRange(0, 2))
        label.attributedText = text
        label.textColor = ThemeColor.textColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.secondaryColor
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalPerPersonLabel, amountPerPersonLabel, horizontalLineView, horizontalStackView])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalBillView, UIView(), totalTipView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupLayout()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        layer.cornerRadius = 12.0
        addShadow(offset: .init(width: 0, height: 3), color: ThemeColor.textColor ?? .black, radius: 12.0, opacity: 0.1)
    }
    
    private func addSubviews() {
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.equalTo(snp.top).offset(16)
            constraintMaker.leading.equalTo(snp.leading).offset(16)
            constraintMaker.trailing.equalTo(snp.trailing).offset(-16)
            constraintMaker.bottom.equalTo(snp.bottom).offset(-16)
        }
        
        horizontalLineView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(1)
        }
    }
    
    func updateView(result: Result) {
        print(result)
        let text = NSMutableAttributedString(string: result.amountPerPerson.currencyFormatted,
                                             attributes: [.font: ThemeFont.largeTitleBold])
        text.addAttributes([
            .font: ThemeFont.titleBold
        ], range: NSMakeRange(0, 2))
        amountPerPersonLabel.attributedText = text
        totalBillView.updateView(amount: result.totalBill)
        totalTipView.updateView(amount: result.totalTip)
    }
}
