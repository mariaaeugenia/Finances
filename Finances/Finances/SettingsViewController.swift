//
//  SettingsViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import UIKit

class SettingsViewController: ViewController {
    
    private var dollarStackView: UIStackView!
    private var dollarLabel: UILabel!
    private var dollarValueTextField: UITextField!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let dollar = dollarValueTextField.text, !dollar.isEmpty {
            Constants.Settings.updateDollarCurrency(with: dollar)
        }
    }
    
    override func prepareViews() {
        dollarStackView = .init()
        dollarValueTextField = .init()
        dollarLabel = .init()
    }
    
    override func addViewHierarchy() {
        dollarStackView.addArrangedSubviews([
            dollarLabel,
            dollarValueTextField
        ])
        
        view.addSubview(dollarStackView)
    }
    
    override func setupConstraints() {
        
        dollarValueTextField.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width*0.3)
            make.height.equalTo(40)
        }
        
        dollarStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.8)
        }
        
    }
    
    override func configureViews() {
        configureStackView()
        configureDolarViews()
    }
    
    private func configureStackView() {
        dollarStackView.alignment = .center
        dollarStackView.distribution = .fill
        dollarStackView.axis = .horizontal
        dollarStackView.spacing = 10
    }
    
    private func configureDolarViews() {
        dollarLabel.text = "Cotação do dólar (R$):"
        dollarLabel.textAlignment = .right
        
        dollarValueTextField.text = Constants.Settings.dollarCurrency
        dollarValueTextField.textAlignment = .right
        dollarValueTextField.keyboardType = .decimalPad
        dollarValueTextField.borderStyle = .roundedRect
        dollarValueTextField.textColor = .black
    }
}
