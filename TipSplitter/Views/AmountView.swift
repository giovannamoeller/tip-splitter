//
//  AmountView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 18/06/24.
//

import UIKit

class AmountView: UIView {

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .systemPink
    }
    
}
