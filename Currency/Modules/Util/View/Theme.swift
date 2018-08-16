//
//  Theme.swift
//  Currency
//
//  Created by Chris Lang on 16/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

enum Theme: Int, CustomStringConvertible {
    case dark
    case light
    
    init?(typeString: String){
        switch typeString.lowercased(){
        case "dark": self.init(rawValue: 0)
        case "light": self.init(rawValue: 1)
        default: return nil
        }
    }
    
    var description: String {
        switch self {
        case .dark: return "Dark"
        case .light: return "Light"
        }
    }
    
    var backgroundColor: CGColor {
        switch self {
        case .dark: return #colorLiteral(red: 0.08, green: 0.08, blue: 0.08, alpha: 1)
        case .light: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .dark: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .light: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    var homeCurrencyBackgroundColor: CGColor {
        switch self {
        case .dark: return #colorLiteral(red: 0.06, green: 0.06, blue: 0.06, alpha: 1)
        case .light: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var targetCurrencyBackgroundColor: CGColor {
        switch self {
        case .dark: return  #colorLiteral(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        case .light: return  #colorLiteral(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        }
    }
    
    var convertAndSwitchBackgroundColor: CGColor {
        switch self {
        case .dark: return #colorLiteral(red: 0.14, green: 0.14, blue: 0.14, alpha: 1)
        case .light: return #colorLiteral(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
        }
    }
    
    var buttonBackgroundColor: CGColor {
        switch self {
        case .dark: return #colorLiteral(red: 0.08, green: 0.08, blue: 0.08, alpha: 1)
        case .light: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var iconImage: UIImage {
        switch self {
        case .dark: return UIImage.init(named: "Icon")!
        case .light: return UIImage.init(named: "Icon")!
        }
    }
}
