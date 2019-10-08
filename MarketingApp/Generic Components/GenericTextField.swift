//
//  GenericTextField.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class GenericTextField: UITextField {
    private let borderHeight: CGFloat = 1
    private let border = CALayer()
    
    var borderColor: UIColor = .lightGray {
        didSet {
            border.backgroundColor = borderColor.cgColor
        }
    }
    
    private func setupTextField() {
        borderStyle = .none // Disable classic border
        font = .systemFont(ofSize: 25, weight: .light)
        
        border.frame = CGRect(x: 0, y: frame.height - borderHeight, width: frame.width, height: borderHeight)
        border.backgroundColor = UIColor.lightGray.cgColor
        
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
}
