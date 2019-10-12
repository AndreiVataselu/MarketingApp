//
//  UIViewControllerExt.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func fromStoryboard<T: UIViewController>() -> T {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! T
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
