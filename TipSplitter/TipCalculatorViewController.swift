//
//  TipCalculatorViewController.swift
//  TipSplitter
//
//  Created by Giovanna Moeller on 17/06/24.
//

import UIKit

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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemPink
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "LightBeige")
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

