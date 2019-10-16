//
//  CartItem.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 16/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

class CartItem {
    let channelName: String
    let offer: Offer
    
    init(channelName: String, offer: Offer) {
        self.channelName = channelName
        self.offer = offer
    }
}
