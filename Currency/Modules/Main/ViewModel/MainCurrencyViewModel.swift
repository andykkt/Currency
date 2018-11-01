//
//  MainCurrencyViewModel.swift
//  Currency
//
//  Created by Chris Lang on 3/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation


struct MainCurrencyViewModel {
    
    // MARK: - Dependency
    var configProvider: ConfigProvidable = ConfigProvider()
    
    var homeCurrencyValue: Double {
        didSet{
            targetCurrencyValue = convert(currency: homeCurrencyValue)
        }
    }
    
    var targetCurrencyValue: Double = 1
    
    var rateString : String {
        get {
            let homeRate = configProvider.homeRate
            let targetRate = configProvider.targetRate
            let homeCurrency = configProvider.homeCurrency
            let targetCurrency = configProvider.targetCurrency
            
            return "\(homeRate) \(homeCurrency) = \(targetRate) \(targetCurrency)"
        }
    }
    
    func convert(currency: Double) -> Double{
        let rate = configProvider.targetRate
        return homeCurrencyValue * rate
    }
    
    mutating func switchCurrencies(){
        let tempHomeCurrency = configProvider.homeCurrency
        configProvider.homeCurrency = configProvider.targetCurrency
        configProvider.targetCurrency = tempHomeCurrency
    }
    
    init() {
        homeCurrencyValue = 1
    }
}
