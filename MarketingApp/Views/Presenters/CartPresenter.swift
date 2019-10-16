//
//  CartPresenter.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 16/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

protocol CartPresenterProtocol: class {
    var itemsInCart: [CartItem] { get }
    func removeFromCart(item: CartItem)
}

class CartPresenter: CartPresenterProtocol {
    
}
