//
//  ListCell.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 20/10/20.
//

import UIKit


class ListCell: TableViewCell {
    
    var mainStackView: UIStackView!
    var stackView: UIStackView!
    var nameLabel: UILabel!
    var valueLabel: UILabel!
    var addressLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        valueLabel.text = nil
        addressLabel.text = nil
    }
    
    override func prepareViews() {
        mainStackView = .init()
        stackView = .init()
        nameLabel = .init()
        valueLabel = .init()
        addressLabel = .init()
    }
    
    override func addViewHierarchy() {
        stackView.addArrangedSubviews([
            nameLabel,
            valueLabel
        ])
        
        mainStackView.addArrangedSubviews([
            stackView,
            addressLabel
        ])
        
        addSubview(mainStackView)
    }
    
    override func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(10)
        }
    }
    
    override func configureViews() {
        configureStackViews()
        configureLabels()
    }
    
    private func configureStackViews() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
    }
    
    private func configureLabels() {
        nameLabel.textColor = .black
        nameLabel.font = .preferredFont(forTextStyle: .callout)
        
        valueLabel.textColor = Constants.Color.main
        valueLabel.font = .preferredFont(forTextStyle: .headline)
        
        addressLabel.textColor = .lightGray
        addressLabel.font = .preferredFont(forTextStyle: .caption2)
        addressLabel.numberOfLines = 4
    }
    
}

extension ListCell {
    
    func set(item: ItemModel) {
        nameLabel.text = item.name
        valueLabel.text = item.isDollar ? item.valueDollar : item.valueReal
        addressLabel.text = item.address
    }
}
