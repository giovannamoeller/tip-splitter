//
//  SplitInputView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import Combine
import CombineCocoa

class SplitInputView: UIView {
    
    private var headerLabelView = SplittedLabelView(topText: "Split", bottomText: "the total")
    
    private let splitSubject: CurrentValueSubject<Int, Never> = .init(1)
    var valuePublisher: AnyPublisher<Int, Never> {
        return splitSubject.removeDuplicates().eraseToAnyPublisher()
    }
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var decrementButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ThemeColor.primaryColor
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = ThemeFont.titleBold
        button.addRoundedCorners(corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner], radius: 8.0)
        button.tapPublisher.flatMap { [unowned self] _ in
            Just(self.splitSubject.value == 1 ? 1 : splitSubject.value - 1)
        }
        .assign(to: \.value, on: splitSubject)
        .store(in: &cancellables)
        return button
    }()
    
    private lazy var incrementButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ThemeColor.primaryColor
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = ThemeFont.titleBold
        button.addRoundedCorners(corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner], radius: 8.0)
        button.tapPublisher.flatMap { [unowned self] _ in
            Just(self.splitSubject.value + 1)
        }
        .assign(to: \.value, on: splitSubject)
        .store(in: &cancellables)
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = ThemeFont.titleBold
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [decrementButton, quantityLabel, incrementButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        observe()
    }
    
    private func observe() {
        splitSubject.sink { [weak self] quantity in
            self?.quantityLabel.text = "\(quantity)"
        }.store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [headerLabelView, horizontalStackView].forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        headerLabelView.snp.makeConstraints { constraintMaker in
            constraintMaker.leading.equalToSuperview()
            constraintMaker.centerY.equalTo(horizontalStackView.snp.centerY)
            constraintMaker.trailing.equalTo(horizontalStackView.snp.leading).offset(-16.0)
            constraintMaker.width.equalTo(68)
        }
        
        horizontalStackView.snp.makeConstraints { constraintMaker in
            constraintMaker.top.trailing.bottom.equalToSuperview()
            constraintMaker.height.equalTo(52.0)
        }
    }
}

