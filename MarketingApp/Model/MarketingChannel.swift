//
//  MarketingChannel.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation


struct MarketingChannel: Decodable {
    let name: String
    let iconLink: String
    let offers: [Offer]
}

struct Offer: Decodable {
    let price: Int
    let services: [String]
}
