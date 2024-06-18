//
//  TipResultView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class TipResultView: UIView {
    
    private var totalBillView = AmountView()
    private var totalTipView = AmountView()
    
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
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12.0
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalBillView, totalTipView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.distribution = .fillProportionally
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
        backgroundColor = .blue
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.leading.trailing.equalToSuperview()
        }
        
        totalBillView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(32)
        }
        
        totalTipView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(32)
        }
        
        horizontalLineView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(1)
        }
    }
}
