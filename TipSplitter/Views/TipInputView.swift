//
//  TipInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class TipInputView: UIView {
    
    private var headerLabelView = SplittedLabelView(topText: "Choose", bottomText: "your tip")

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .yellow
    }
    
}
