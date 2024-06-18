//
//  TipCalculatorViewController.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import SnapKit

class TipCalculatorViewController: UIViewController {
    
    private var logoView = LogoView()
    private var tipResultView = TipResultView()
    private var billInputView = BillInputView()
    private var tipInputView = TipInputView()
    private var splitInputView = SplitInputView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoView, tipResultView, billInputView, tipInputView, splitInputView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 36
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeColor.secondaryLighterColor
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalTo(view.snp.leadingMargin).offset(16)
            constraintMaker.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            constraintMaker.bottom.equalTo(view.snp.bottomMargin).offset(-16)
            constraintMaker.top.equalTo(view.snp.topMargin).offset(16)
        }
    }
}

