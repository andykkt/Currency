//
//  ThemeManager.swift
//  Currency
//
//  Created by Chris Lang on 20/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

public class ThemeManager {
    public static let shared = ThemeManager()
    var theme: Theme = .dark {
        didSet {
            applyTheme()
            NotificationCenter.default.post(name: .updateTheme, object: nil)
        }
    }
    
    public init(){}
    
    func applyTheme(){
        UIApplication.shared.statusBarStyle = theme.statusBarStyle
    }
}
