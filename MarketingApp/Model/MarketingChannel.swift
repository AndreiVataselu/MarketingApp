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
    let packages: [Offer]
    
    enum CodingKeys: String, CodingKey {
        case name, iconLink = "icon", packages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        iconLink = try container.decode(String.self, forKey: .iconLink)
        packages = try container.decode([Offer].self, forKey: .packages)
        
    }
    
    static func decodeOffers() -> [MarketingChannel]? {
        guard let url = Bundle.main.url(forResource: "Offers", withExtension: "json"),
            let json = try? Data(contentsOf: url) else {
            return nil
        }
        
        return try? JSONDecoder().decode([MarketingChannel].self, from: json)
    }
}

struct Offer: Decodable {
    let price: Int
    let services: [String]
}
