//
//  MainViewController.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Dependency
    
    var configProvider: ConfigProvidable?
    
    // MARK: - Outlets
    
    @IBOutlet weak var topCurrencyView: CurrencyView!
    @IBOutlet weak var bottomCurrencyView: CurrencyView!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.performWithoutAnimation {
            topCurrencyView.textField.becomeFirstResponder()
        }
    }
}

extension MainViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}
