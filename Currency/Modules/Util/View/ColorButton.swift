//
//  ColorButton.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

@IBDesignable
class ColorButton: UIButton {

    @IBInspectable var buttonBackgroundColor: UIColor? {
        didSet {
            let image = buttonBackgroundColor?.image(width: frame.width, height: frame.height)
            setBackgroundImage(image, for: .normal)
        }
    }

}
