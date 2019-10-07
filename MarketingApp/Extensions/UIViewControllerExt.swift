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
    
}
