//
//  ChooseMarketingChannelTVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import UIKit

class ChooseMarketingChannelTVC: UITableViewCell {
    @IBOutlet private weak var logoImage: UIView!
    @IBOutlet private weak var channelNameLabel: UILabel!
    
    
    func configure(channelName: String) {
        channelNameLabel.text = channelName
    }
    
}
