//
//  BillInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class BillInputView: UIView {
    
    private var headerLabel = SplittedLabelView(primaryText: "Enter", secondaryText: "your bill")
    
    private lazy var textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerLabel, textFieldContainerView])
        stackView.axis = .horizontal
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
        addSubview(horizontalStackView)
    }
    
    private func setupConstraints() {
        horizontalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.edges.equalToSuperview()
        }
    }
    
}
