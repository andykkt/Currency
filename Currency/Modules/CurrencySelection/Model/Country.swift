//
//  Country.swift
//  Currency
//
//  Created by Chris Lang on 5/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import Foundation

struct Country {
    var longTitle : String
    var shortTitle : String
    
    init(longTitle: String, shortTitle: String){
        self.longTitle = longTitle
        self.shortTitle = shortTitle
    }
}
