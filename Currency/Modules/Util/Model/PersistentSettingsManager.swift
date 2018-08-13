//
//  PersistentSettingsManager.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation
import AKControls

class PersistentSettingsManager: DefaultsHandlerType {
    
    // MARK: - DefaultHandlerType
    
    enum Key: String {
        case isOnboardingFinished
        case homeCurrency
        case targetCurrency
        case homeRate
        case targetRate
    }
    
    static var defaults: UserDefaults {
        return UserDefaults.standard
    }
}
