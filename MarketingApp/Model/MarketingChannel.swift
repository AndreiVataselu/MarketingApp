//
//  MarketingChannel.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 07/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

enum Indicator: String, Decodable {
    case locations = "Locatii"
    case age = "Varsta"
    case sex = "Sex"
    case languages = "Limbi cunoscute"
    case events = "Evenimente"
    case company = "Companie"
    case industry = "Industrie"
    case experience = "Experienta"
    case education = "Educatie"
    case technology = "Tehnologie"
    case interests = "Interese"
    case deviceType = "Tipuri de dispozitiv"
    case keywords = "Cuvinte, fraze cheie"
    case similarProducts = "Produse/servicii similare"
    case links = "Link-uri"
}

struct MarketingChannel: Decodable {
    let name: String
    let iconLink: String
    let packages: [Offer]
    let indicators: [Indicator]
    
    enum CodingKeys: String, CodingKey {
        case name, iconLink = "icon", packages, indicators
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        iconLink = try container.decode(String.self, forKey: .iconLink)
        packages = try container.decode([Offer].self, forKey: .packages)
        indicators = try container.decode([Indicator].self, forKey: .indicators)
        
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
