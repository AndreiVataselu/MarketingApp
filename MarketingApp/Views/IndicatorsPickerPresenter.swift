//
//  IndicatorsPickerPresenter.swift
//  MarketingApp
//
//  Created by Andrei Vataselu on 12/10/2019.
//  Copyright © 2019 Andrei Vataselu. All rights reserved.
//

import Foundation

protocol IndicatorsPickerPresenterProtocol: class {
    var indicators: [Indicator] { get }
    func indicatorSelected(index: Int)
    func indicatorDeselected(index: Int)
    func sendIndicators()
}

class IndicatorsPickerPresenter: IndicatorsPickerPresenterProtocol {
    private weak var view: IndicatorsPickerViewProtocol?
    var indicators: [Indicator] {
        return [.locations, .age, .sex, .languages, .events, .company, .industry, .experience, .education, .technology, .interests, .deviceType, .keywords, .similarProducts, .links]
    }
    
    var chosenIndicators: [Indicator] = [] {
        didSet {
            view?.changeButtonState(hidden: chosenIndicators.isEmpty)
        }
    }
    
    init(view: IndicatorsPickerViewProtocol) {
        self.view = view
    }
    
    func indicatorSelected(index: Int) {
        guard index < indicators.count else {
            return
        }
        chosenIndicators.append(indicators[index])
    }
    
    func indicatorDeselected(index: Int) {
        chosenIndicators = chosenIndicators.filter { $0 != indicators[index] }
    }
    
    func sendIndicators() {
        SessionManager.shared.indicators = chosenIndicators
    }
    
}
