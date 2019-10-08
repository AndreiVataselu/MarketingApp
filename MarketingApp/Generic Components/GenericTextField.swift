//
//  GenericTextField.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class GenericTextField: UIView {
    private let textField = UITextField()
    private let bottomView = UIView()
    private let maxCharacters = 50
    
    var text: String {
        return textField.text ?? ""
    }
    
    func setup() {
        addSubview(textField)
        addSubview(bottomView)
        setupConstraints()
        textField.delegate = self
    }
    
    private func setupConstraints() {
        // First we set up the bottom view so we can anchor the bottom of the textfield to it
        bottomView.backgroundColor = .black
        
        // Bottom view constraints config
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        // Textfield Constraints config
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        
        textField.font = .systemFont(ofSize: 25, weight: .regular)
        textField.borderStyle = .none
        textField.autocorrectionType = .no
    }
}

extension GenericTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomView.backgroundColor = .lightGray
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomView.backgroundColor = .black
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return false
        }
        
        guard string.count + text.count <= maxCharacters else {
            let lastIndex = string.index(string.startIndex, offsetBy: maxCharacters - text.count)
            let newString = "\(text)\(string[..<lastIndex])"
            textField.text = newString
            return false
        }
        
        
        return text.count < maxCharacters || string.isEmpty
        
    }
}
