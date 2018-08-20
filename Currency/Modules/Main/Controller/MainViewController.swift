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
        setTheme()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme(notification:)), name: .updateTheme, object: nil)
    }
    
    @objc func updateTheme(notification: NSNotification){
        setTheme()
    }
    
    //MARK: - Testing for Theme switching
    //TODO: - Remove when theme is implemented elsewhere
    @IBAction func switchButtonPressed(_ sender: ColorButton) {
        if ThemeManager.shared.theme == .dark {
            ThemeManager.shared.theme = .light
        } else {
            ThemeManager.shared.theme = .dark
        }
    }
}

extension MainViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}

extension MainViewController: Themeable {
    func setTheme() {
        let theme = ThemeManager.shared.theme
        topCurrencyView.color = theme.homeCurrencyBackgroundColor
        topCurrencyView.textColor = theme.textColor
        bottomCurrencyView.color = theme.targetCurrencyBackgroundColor
        bottomCurrencyView.textColor = theme.textColor
        view.backgroundColor = theme.backgroundColor
    }
}
