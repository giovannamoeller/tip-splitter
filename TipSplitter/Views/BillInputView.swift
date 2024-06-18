//
//  BillInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class BillInputView: UIView {
    
    private var label = SplittedLabelView(primaryText: "Enter", secondaryText: "your bill")

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        backgroundColor = .green
        addSubview(label)
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { constraintMaker in
            constraintMaker.edges.equalToSuperview()
        }
    }
    
}
