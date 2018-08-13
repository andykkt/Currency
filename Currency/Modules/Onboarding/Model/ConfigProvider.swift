//
//  ConfigProvider.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation

struct ConfigProvider: ConfigProvidable {
    var isOnboardingFinished: Bool {
        get {
            return PersistentSettingsManager.bool(for: .isOnboardingFinished)
        }
        set {
            PersistentSettingsManager.setValue(newValue, for: .isOnboardingFinished)
        }
    }
    
    var homeCurrency: String {
        get {
            return PersistentSettingsManager.string(for: .homeCurrency) ?? ""
        }
        set {
            PersistentSettingsManager.setValue(newValue, for: .homeCurrency)
        }
    }
    
    var targetCurrency: String {
        get {
            return PersistentSettingsManager.string(for: .targetCurrency) ?? ""
        }
        set {
            PersistentSettingsManager.setValue(newValue, for: .targetCurrency)
        }
    }
    
    var homeRate: Double {
        get {
            return PersistentSettingsManager.double(for: .homeRate) ?? 0.0
        }
        set {
            PersistentSettingsManager.setValue(newValue, for: .homeRate)
        }
    }
    
    var targetRate: Double {
        get {
            return PersistentSettingsManager.double(for: .targetRate) ?? 0.0
        }
        set {
            PersistentSettingsManager.setValue(newValue, for: .targetRate)
        }
    }
    
    
}
