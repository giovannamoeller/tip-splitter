//
//  LogoView.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit
import SnapKit

class LogoView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo-transparent"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip Splitter"
        label.font = ThemeFont.titleBold
        label.textColor = ThemeColor.textColor
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        stackView.alignment = .center
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        accessibilityIdentifier = ScreenIdentifier.LogoView.logoView.rawValue
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
            constraintMaker.top.bottom.equalToSuperview()
            constraintMaker.centerX.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { constraintMaker in
            constraintMaker.height.equalTo(logoImageView.snp.width)
        }
    }
    
}
