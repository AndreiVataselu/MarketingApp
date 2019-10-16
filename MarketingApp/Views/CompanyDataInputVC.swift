//
//  CompanyNameInputPage.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class CompanyDataInputVC: UIViewController {
    
    @IBOutlet private weak var employeesContainer: UIView!
    @IBOutlet private weak var buttonContainer: UIView!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var companyEmployeesCount: UILabel!
    
    @IBOutlet private weak var nextButton: UIButton!
    
    @IBOutlet private weak var companyNameTF: GenericTextField!
    @IBOutlet private weak var companyEmployeesTF: GenericTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyEmployeesTF.keyboardType = .numberPad
        companyNameTF.autocorrectionType = .no
        nextButton.backgroundColor = .lightGray
        companyNameTF.delegate = self
        companyEmployeesTF.delegate = self

    }
    
    @IBAction private func nextButtonPressed(_ sender: UIButton) {
        guard let companyName = companyNameTF.text,
            let employeesCount = companyEmployeesTF.text,
            !companyName.isEmpty,
            !employeesCount.isEmpty else {
            return
        }
        
        SessionManager.shared.companyName = companyName
        SessionManager.shared.employees = Int(employeesCount) ?? 0
        
        guard SessionManager.shared.companySize != .none else {
            alert(title: "Numar invalid", message: "Numarul angajatilor este invalid.")
            return
        }
        let indicatorsPickerVC = IndicatorsPickerVC.fromStoryboard()
        navigationController?.pushViewController(indicatorsPickerVC, animated: true)
    }
}


extension CompanyDataInputVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? GenericTextField else {
            return
        }
        
        companyNameLabel.textColor = textField == companyNameTF ? .lightGray : .black
        companyEmployeesCount.textColor = textField == companyEmployeesTF ? .lightGray : .black
        
        textField.borderColor = .lightGray
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textField = textField as? GenericTextField else {
            return
        }
        
        if textField == companyNameTF {
            companyNameLabel.textColor = .black
        } else {
            companyEmployeesCount.textColor = .black
        }
        
        textField.borderColor = .lightGray
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == companyNameTF {
            companyNameTF.resignFirstResponder()
            companyEmployeesTF.becomeFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let companyName = companyNameTF.text,
            let companyEmployees = companyEmployeesTF.text else {
                return
        }
        
        nextButton.backgroundColor = companyName.isEmpty || companyEmployees.isEmpty ? .lightGray : .black
    }
}
