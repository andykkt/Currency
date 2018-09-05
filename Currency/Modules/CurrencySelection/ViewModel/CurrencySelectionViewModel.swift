//
//  CurrencySelectionViewModel.swift
//  Currency
//
//  Created by Chris Lang on 5/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation

struct CurrencySelectionViewModel {
    
    // MARK: - Dependency
    var configProvider: ConfigProvidable = ConfigProvider()
    
    var homeCurrency : String {
        didSet{ configProvider.homeCurrency = homeCurrency }
    }
    
    var targetCurrency : String {
        didSet{ configProvider.targetCurrency = targetCurrency }
    }
}
