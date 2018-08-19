//
//  CurrencyView.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls

@IBDesignable class CurrencyView: NibView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    @IBInspectable var image: UIImage? {
        didSet { imageView.image = image }
    }
    
    @IBInspectable var countryCode: String? {
        didSet { countryLabel.text = countryCode }
    }
    
    @IBInspectable var rate: String? {
        didSet { textField.text = rate }
    }
    
    @IBInspectable var color: UIColor? {
        didSet { contentView.backgroundColor = color }
    }
    
    // Additional variable to set Theme colour
    @IBInspectable var textColor: UIColor? {
        didSet {
            textField.textColor = textColor
            countryLabel.textColor = textColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.inputView = NumberPadView()
        
    }
}
