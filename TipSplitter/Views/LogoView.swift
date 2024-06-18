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

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { constraintMaker in
            constraintMaker.centerX.equalTo(snp.centerX)
            constraintMaker.centerY.equalTo(snp.centerY)
            constraintMaker.height.equalTo(snp.height)
        }
    }
    
}
