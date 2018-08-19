//
//  NumberPadButton.swift
//  Currency
//
//  Created by Andy Kim on 19/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

class NumberPadButton: UIButton {
    
    @IBInspectable var isBackspace: Bool = false {
        didSet {
            commonInit()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let theme = Theme.Current.shared.theme
        let backgroundColor = theme.numberPadButtonBackgroundColor
        let selectBackgroundcolor = isBackspace ? theme.numberPadButtonBackspaceSelectBackgroundColor : theme.numberPadButtonSelectBackgroundColor
        setBackgroundImage(backgroundColor.image(width: bounds.width, height: bounds.height), for: .normal)
        setBackgroundImage(selectBackgroundcolor.image(width: bounds.width, height: bounds.height), for: .selected)
        setBackgroundImage(selectBackgroundcolor.image(width: bounds.width, height: bounds.height), for: .focused)
        setBackgroundImage(selectBackgroundcolor.image(width: bounds.width, height: bounds.height), for: .highlighted)
        setTitleColor(theme.numberPadButtonTextColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
    }

}
