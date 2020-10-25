//
//  NewItemViewController.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import UIKit

class NewItemViewController: ViewController {
    
    var mainStackView: UIStackView!
    var nameTextField: TextField!
    var valueTextField: TextField!
    var addressTextField: TextField!
    var dollarStackView: UIStackView!
    var dollarLabel: UILabel!
    var dollarSwicth: UISwitch!
    var saveButton: UIButton!
    
    var vm: NewItemViewModel!
    
    init(with vm: NewItemViewModel) {
        self.vm = vm
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.loadData()
    }
    
    override func prepareViews() {
        mainStackView = .init()
        nameTextField = .init()
        valueTextField = .init()
        addressTextField = .init()
        dollarStackView = .init()
        dollarLabel = .init()
        dollarSwicth = .init()
        saveButton = .init()
    }
    
    override func addViewHierarchy() {
        
        dollarStackView.addArrangedSubviews([
            dollarSwicth,
            dollarLabel
        ])
        
        mainStackView.addArrangedSubviews([
            nameTextField,
            valueTextField,
            addressTextField,
            dollarStackView
        ])
        
        view.addSubviews([
            mainStackView,
            saveButton
        ])
    }
    
    override func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.right.equalToSuperview().inset(20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(mainStackView.snp.bottom).offset(30)
        }
    }
    
    override func configureViews() {
        title = "Novo Ítem"
        vm.presenter = self
        configureStackView()
        configureTextFields()
        configureDolarViews()
        configureButton()
    }
    
    private func configureStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 20
    }
    
    private func configureTextFields() {
        nameTextField.placeholder = "Nome do item"
        valueTextField.placeholder = "0,00"
        valueTextField.keyboardType = .decimalPad
        addressTextField.placeholder = "Rua 123, 45, Cidade, Estado"
    }
    
    private func configureDolarViews() {
        dollarStackView.axis = .horizontal
        dollarStackView.alignment = .center
        dollarStackView.distribution = .fill
        dollarStackView.spacing = 5
        
        dollarLabel.text = "Valor em dólar?"
        dollarLabel.font = .preferredFont(forTextStyle: .caption1)
        dollarLabel.textColor = .black
    }
    
    private func configureButton() {
        saveButton.backgroundColor = Constants.Color.main
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped(_ :)), for: .touchUpInside)
        saveButton.setTitle("Salvar", for: .normal)
    }
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
        vm.save(name: nameTextField.text, value: valueTextField.text, address: addressTextField.text, isDollar: dollarSwicth.isOn)
    }
    
}

extension NewItemViewController: NewItemPresentable {
    func load(item: ItemModel) {
        nameTextField.text = item.name
        valueTextField.text = "\(item.value)"
        addressTextField.text = item.address
        dollarSwicth.isOn = item.isDollar
    }
    
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
