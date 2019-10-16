//
//  SessionManager.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 12/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

enum CompanySize: String {
    case none
    case small = "mica"
    case medium = "medie"
    case large = "mare"
}

class SessionManager {
    static let shared = SessionManager()
    
    // User's company information
    private(set) var companySize: CompanySize = .none
    var indicators: [Indicator] = []
    var companyName: String = ""
    var channels: [MarketingChannel] = []
    var employees: Int = 0 {
        didSet {
            if employees <= 0 {
                companySize = .none
            } else if 1...50 ~= employees {
                companySize = .small
            } else if 51...100 ~= employees {
                companySize = .medium
            } else {
                companySize = .large
            }
        }
    }
    
    func generateOffers() -> [MarketingChannel] {
        return channels.filter { marketingChannel in
            let channelIndicatorsSet = Set(marketingChannel.indicators)
            let chosenIndicatorsSet = Set(indicators)
            return !channelIndicatorsSet.intersection(chosenIndicatorsSet).isEmpty
        }
    }
    
    private init() {
        if let path = Bundle.main.path(forResource: "Offers", ofType: "json"),
            case let url = URL(fileURLWithPath: path),
            let json = try? Data(contentsOf: url) {
            
            do {
                channels = try JSONDecoder().decode([MarketingChannel].self, from: json)
            } catch {
                print("For some reason I couldn't decode the channels 🤷🏻‍♂️")
            }
            
        }
    }
    
}

