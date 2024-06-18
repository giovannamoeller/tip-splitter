//
//  BillInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

class BillInputView: UIView {
    
    private var headerLabelView = SplittedLabelView(topText: "Enter", bottomText: "your bill")
    
    private lazy var textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8.0
        view.addShadow(offset: .init(width: 0, height: 3), color: ThemeColor.textColor ?? .black, radius: 12.0, opacity: 0.1)
        return view
    }()
    
    private lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.font = ThemeFont.titleBold
        label.textColor = ThemeColor.textColor
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = ThemeFont.bodyBold
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.tintColor = ThemeColor.textColor
        textField.textColor = ThemeColor.textColor
        let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: frame.size.width, height: 36))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapDoneButton))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        return textField
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
        [headerLabelView, textFieldContainerView].forEach(addSubview(_:))
        textFieldContainerView.addSubview(currencyLabel)
        textFieldContainerView.addSubview(textField)
    }
    
    private func setupConstraints() {
        headerLabelView.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.centerY.equalTo(textFieldContainerView.snp.centerY)
            constraintMaker.trailing.equalTo(textFieldContainerView.snp.leading).offset(-16.0)
            constraintMaker.width.equalTo(68)
        }
        
        textFieldContainerView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.trailing.bottom.equalToSuperview()
            constraintMaker.height.equalTo(52.0)
        }
        
        currencyLabel.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview()
            constraintMaker.leading.equalTo(textFieldContainerView.snp.leading).offset(8.0)
        }
        
        textField.snp.makeConstraints { constraintMaker in
            constraintMaker.top.bottom.equalToSuperview()
            constraintMaker.leading.equalTo(currencyLabel.snp.trailing).offset(8.0)
            constraintMaker.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-8.0)
        }
    }
    
    @objc private func didTapDoneButton() {
        textField.endEditing(true)
    }
    
}
