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
    case small = "Mica"
    case medium = "Medie"
    case large = "Mare"
}

class SessionManager {
    private(set) var companySize: CompanySize = .none
    
    var name: String = ""
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
    var indicators: [Indicator] = []
    
    static let shared = SessionManager()
    
    private init() {
        
    }
    
}

