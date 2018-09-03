//
//  NumberPadView.swift
//  Currency
//
//  Created by Andy Kim on 19/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls


protocol NumberPadViewDelegate {
    func numberPadShouldChange(_ number: Int)
}

@IBDesignable class NumberPadView: NibView {
    var delegate: NumberPadViewDelegate?
    @IBAction func touchUpNumbers(_ sender: UIButton) {
        delegate?.numberPadShouldChange((sender as UIButton).tag)
    }
}
