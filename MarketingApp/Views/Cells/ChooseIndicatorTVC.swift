//
//  ChooseIndicatorTVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 12/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

class ChooseIndicatorTVC: UITableViewCell {
    @IBOutlet private weak var indicatorNameLabel: UILabel!
    private var isCellSelected = false {
        didSet {
            accessoryType = isCellSelected ? .checkmark : .none
            indicatorNameLabel?.font = isCellSelected ? .systemFont(ofSize: 17, weight: .regular) : .systemFont(ofSize: 17, weight: .thin)
        }
    }
    
    func configureCell(indicatorName: String) {
        accessoryType = isCellSelected ? .checkmark : .none
        indicatorNameLabel?.font = isCellSelected ? .systemFont(ofSize: 17, weight: .regular) : .systemFont(ofSize: 17, weight: .thin)
        indicatorNameLabel.text = indicatorName
    }

    func selectedCell() {
        isCellSelected = !isCellSelected
    }
}
