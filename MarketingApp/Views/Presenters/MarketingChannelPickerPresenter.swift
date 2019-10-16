//
//  MarketingChannelPickerPresenter.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 14/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

protocol MarketingChannelPresenterProtocol: class {
    var channels: [MarketingChannel] { get }
    var cart: CartProtocol { get }
    func addToCart(cartItem: CartItem)
}

class MarketingChannelPresenter: MarketingChannelPresenterProtocol {
    var channels: [MarketingChannel] {
        return SessionManager.shared.generateOffers()
    }
    
    var cart: CartProtocol = Cart()
    
    func addToCart(cartItem: CartItem) {
        cart.add(item: cartItem)
    }
}
