//
//  CartItem.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 16/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

struct CartItem {
    let channelName: String
    let offer: Offer
    
    static func !=(lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.channelName != rhs.channelName
    }
}

protocol CartProtocol: class {
    var items: [CartItem] { get }
    var totalPrice: Int { get }
    func add(item: CartItem)
    func remove(item: CartItem)
}

class Cart: CartProtocol {
    private var itemsBuffer: [CartItem] = []
    
    var items: [CartItem] {
        return itemsBuffer
    }
    
    var totalPrice: Int {
        return items.reduce(0) { $0 + $1.offer.price } 
    }
    
    func add(item: CartItem) {
        itemsBuffer.append(item)
    }
    
    func remove(item: CartItem) {
        itemsBuffer = itemsBuffer.filter { $0 != item }
    }
}
