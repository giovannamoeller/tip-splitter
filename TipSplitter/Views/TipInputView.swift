//
//  TipInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import Combine
import CombineCocoa

class TipInputView: UIView {
    
    private var tipSubject = CurrentValueSubject<Tip, Never>(.none)
    private var cancellables = Set<AnyCancellable>()
    
    var valuePublisher: AnyPublisher<Tip, Never> {
        return tipSubject.eraseToAnyPublisher()
    }
    
    private var headerLabelView = SplittedLabelView(topText: "Choose", bottomText: "your tip")
    
    private lazy var tenPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .tenPercent)
        button.tapPublisher.flatMap ({Just(Tip.tenPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var fifteenPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .fifteenPercent)
        button.tapPublisher.flatMap ({Just(Tip.fifteenPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var twentyPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .twentyPercent)
        button.tapPublisher.flatMap ({Just(Tip.twentyPercent)})
            .assign(to: \.value, on: tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var customPercentTipButton: TipPercentageButton = {
        let button = TipPercentageButton(tip: .custom(value: 0))
        button.tapPublisher.sink { [weak self] _ in
            self?.handleCustomTipButtonTap()
        }.store(in: &cancellables)
        return button
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView, customPercentTipButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16.0
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tenPercentTipButton, fifteenPercentTipButton, twentyPercentTipButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16.0
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(headerLabelView)
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        headerLabelView.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.centerY.equalTo(verticalStackView.snp.centerY)
            constraintMaker.trailing.equalTo(verticalStackView.snp.leading).offset(-16.0)
            constraintMaker.width.equalTo(68)
        }
        
        verticalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.trailing.bottom.equalToSuperview()
        }
    }
    
    private func handleCustomTipButtonTap() {
        let alertController = UIAlertController(title: "Enter custom tip", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Make it generous!"
            textField.keyboardType = .numberPad
            textField.autocorrectionType = .no
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let text = alertController.textFields?.first?.text,
                  let value = Int(text) else { return }
            self?.tipSubject.send(.custom(value: value))
        }
        [okAction, cancelAction].forEach(alertController.addAction(_:))
        parentViewController?.present(alertController, animated: true)
    }
    
    private func resetView() {
        [tenPercentTipButton, fifteenPercentTipButton, twentyPercentTipButton, customPercentTipButton].forEach { button in
            button.backgroundColor = ThemeColor.primaryColor
        }
        let text = NSMutableAttributedString(string: "Custom tip",
                                             attributes: [
                                                .font: ThemeFont.titleBold
                                             ])
        customPercentTipButton.setAttributedTitle(text, for: .normal)
    }
    
    func reset() {
        tipSubject.send(.none)
    }
    
    private func observe() {
        tipSubject.sink { [weak self] tip in
            self?.resetView()
            switch tip {
            case .none: break
            case .tenPercent:
                self?.tenPercentTipButton.backgroundColor = ThemeColor.textColor
            case .fifteenPercent:
                self?.fifteenPercentTipButton.backgroundColor = ThemeColor.textColor
            case .twentyPercent:
                self?.twentyPercentTipButton.backgroundColor = ThemeColor.textColor
            case .custom(let value):
                self?.customPercentTipButton.backgroundColor = ThemeColor.textColor
                let string = value > 9 ? "\(value)%" : "0\(value)%"
                let text = NSMutableAttributedString(string: string,
                                                     attributes: [
                                                        .font: ThemeFont.titleBold
                                                     ])
                text.addAttributes([
                    .font: ThemeFont.bodyBold
                ], range: NSMakeRange(2, 1))
                self?.customPercentTipButton.setAttributedTitle(text, for: .normal)
            }
        }.store(in: &cancellables)
    }
    
}
