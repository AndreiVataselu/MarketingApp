//
//  CartTVC.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 16/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation
import UIKit

class CartTVC: UITableViewCell {
    @IBOutlet private weak var channelNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    private var item: CartItem?
    weak var delegate: RemoveFromCartDelegate?
    
    @IBAction private func removeFromCart(_ sender: UIButton) {
        guard let item = item else {
            return
        }
        
        delegate?.removeFromCart(item: item)
    }
    
    func configure(cartItem: CartItem) {
        item = cartItem
        
        guard let item = item else {
            return
        }
        
        channelNameLabel.text = item.channelName
        priceLabel.text = "\(item.offer.price) €"
    }
}
