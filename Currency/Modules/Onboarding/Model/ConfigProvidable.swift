//
//  ConfigProvidable.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation

protocol ConfigProvidable {
    var isOnboardingFinished: Bool { get set }
    var homeCurrency: String { get set }
    var targetCurrency: String { get set }
    var homeRate: Double { get set }
    var targetRate: Double { get set }
}
