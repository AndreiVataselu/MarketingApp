//
//  CompanyNameInputPage.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class CompanyDataInputPage: UIViewController {
    
    @IBOutlet private weak var employeesContainer: UIView!
    @IBOutlet private weak var buttonContainer: UIView!
    
    @IBOutlet private weak var companyNameTF: GenericTextField!
    @IBOutlet private weak var companyEmployeesTF: GenericTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyNameTF.delegate = self
        companyEmployeesTF.delegate = self

    }
    
    @IBAction private func nextButtonPressed(_ sender: UIButton) {
        
    }
}


extension CompanyDataInputPage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? GenericTextField else {
            return
        }
        
        textField.borderColor = .black
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textField = textField as? GenericTextField else {
            return
        }
        
        textField.borderColor = .lightGray
    }
}
