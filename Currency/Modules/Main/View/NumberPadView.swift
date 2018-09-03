//
//  NumberPadView.swift
//  Currency
//
//  Created by Andy Kim on 19/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls

@IBDesignable
class NumberPadView: NibView {

    var delegate: NumericKeyboardDelegate?
    
    @IBAction func numberPressed(_ sender: NumberPadButton) {
        delegate?.numericKeyPressed(key: sender.tag)
    }
    
    @IBAction func pointPressed(_ sender: NumberPadButton) {
        delegate?.pointPressed(point: ".")
    }
    
    @IBAction func backspacePressed(_ sender: NumberPadButton) {
        delegate?.numericBackspacePressed()
    }
    
}

protocol NumericKeyboardDelegate {
    func numericKeyPressed(key: Int)
    func numericBackspacePressed()
    func pointPressed(point: String)
}
