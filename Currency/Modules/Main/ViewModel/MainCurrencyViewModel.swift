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
    
    func convert(currency: Double) -> Double{
        let rate = configProvider.targetRate
        return homeCurrencyValue * rate
    }
    
    init() {
        homeCurrencyValue = 1
    }
}
