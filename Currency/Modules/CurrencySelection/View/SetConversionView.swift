//
//  SetConversionView.swift
//  Currency
//
//  Created by Chris Lang on 4/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls

@IBDesignable class SetConversionView: NibView {

    @IBOutlet weak var homeTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var homeCurrencyFlag: UIImageView!
    @IBOutlet weak var targetCurrencyFlag: UIImageView!
    @IBOutlet weak var homeCurrencyLabel: UILabel!
    @IBOutlet weak var targetCurrencyLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var homeCurrencyValue : String? {
        didSet{ homeTextField.text = homeCurrencyValue }
    }
    
    var targetCurrencyValue : String? {
        didSet{ targetTextField.text = targetCurrencyValue }
    }
    
    var homeFlag : UIImage? {
        didSet{ homeCurrencyFlag.image = homeFlag }
    }
    
    var targetFlag : UIImage? {
        didSet{ targetCurrencyFlag.image = targetFlag }
    }
    
    var homeCurrency : String? {
        didSet{ homeCurrencyLabel.text = homeCurrency }
    }
    
    var targetCurrency : String? {
        didSet{ targetCurrencyLabel.text = targetCurrency }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

}
