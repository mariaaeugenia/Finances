//
//  AboutViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 17/10/20.
//

import Foundation
import UIKit


class AboutViewController: ViewController {
    
    private var stackView: UIStackView!
    private var logoImageView: UIImageView!
    private var textLabel: UILabel!
    private var versionLabel: UILabel!
    
    override func prepareViews() {
        stackView = .init()
        logoImageView = .init()
        textLabel = .init()
        versionLabel = .init()
    }
    
    override func addViewHierarchy() {
        
        stackView.addArrangedSubviews([
            logoImageView,
            textLabel,
            versionLabel
        ])
        
        view.addSubview(stackView)
    }
    
    override func setupConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(stackView.snp.width).multipliedBy(0.6)
        }
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    override func configureViews() {
        configureStackView()
        configureImageView()
        configureLabels()
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 25
    }
    
    private func configureImageView() {
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "logo")
    }
    
    private func configureLabels() {
        textLabel.textAlignment = .center
        textLabel.textColor = .black
        textLabel.font = .preferredFont(forTextStyle: .title3)
        textLabel.numberOfLines = 2
        textLabel.text = "Maria Eugênia\nRM333750"
        
        versionLabel.textAlignment = .center
        versionLabel.textColor = .black
        versionLabel.font = .preferredFont(forTextStyle: .body)
        versionLabel.text = "Versão: " + UIApplication.appVersion
    }
}
