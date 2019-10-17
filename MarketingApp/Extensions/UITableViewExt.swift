//
//  UIColor.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 08/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func getHeaderView(text: String) -> UIView {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 100)
        let view = UIView(frame: frame)
        
        let label = UILabel(frame: view.bounds)
        label.text = text
        label.font = .systemFont(ofSize: 30, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        return view
    }
}
