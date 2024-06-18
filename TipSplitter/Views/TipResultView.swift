//
//  TipResultView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class TipResultView: UIView {
    
    private var totalBillView = AmountView(labelText: "Total bill", amountValueText: "$000")
    private var totalTipView = AmountView(labelText: "Total tip", amountValueText: "$000", alignment: .trailing)
    
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
            string: "$000",
            attributes: [
                .font: ThemeFont.largeTitleBold
            ])
        text.addAttributes([
            .font: ThemeFont.titleBold
        ], range: NSMakeRange(0, 1))
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
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalBillView, UIView(), totalTipView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8.0
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
            constraintMaker.top.leading.equalToSuperview().offset(16)
            constraintMaker.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        horizontalLineView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(1)
        }
    }
}
