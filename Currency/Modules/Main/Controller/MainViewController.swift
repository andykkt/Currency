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
    lazy var viewModel: MainCurrencyViewModel = {
        return MainCurrencyViewModel()
    }()
    
    // MARK: - Outlets
    
    @IBOutlet weak var topCurrencyView: CurrencyView! {
        didSet{
            topCurrencyView.delegate = self
        }
    }
    @IBOutlet weak var bottomCurrencyView: CurrencyView!
    
    @IBOutlet weak var rateButton: ColorButton!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme(notification:)), name: .updateTheme, object: nil)
        
        //TODO: - set rate better
        configProvider?.homeRate = 1
        configProvider?.targetRate = 1.5
//        configProvider?.homeCurrency = "USD"
//        configProvider?.targetCurrency = "AUD"
        
        //TODO: - initial view?
        topCurrencyView.rate = "1"
        updateValues()
        updateViews(view: topCurrencyView)
        updateViews(view: bottomCurrencyView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.performWithoutAnimation {
            topCurrencyView.textField.becomeFirstResponder()
        }
        rateButton.setTitle(viewModel.rateString, for: .normal)
        updateValues()
        updateViews(view: topCurrencyView)
        updateViews(view: bottomCurrencyView)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSetRate"{
            topCurrencyView.textField.resignFirstResponder()
            let destinationVC = segue.destination as! ChangeRateViewController
            destinationVC.configProvider = configProvider
        }
    }
    
}

extension MainViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}

extension MainViewController: NumericKeyboardDelegate{
    func numericKeyPressed(key: Int) {
        if topCurrencyView.textField.text == "0" {
            topCurrencyView.textField.text? = "\(key)"
        } else {
            topCurrencyView.textField.text?.append("\(key)")
        }
        updateValues()
    }
    
    func numericBackspacePressed() {
        if var text = topCurrencyView.textField.text, text.characters.count > 0 {
            _ = text.remove(at: text.index(before: text.endIndex))
            if text.characters.count > 0 {
                topCurrencyView.textField.text = text
            } else {
                topCurrencyView.textField.text = "0"
            }
        }
        updateValues()
    }
    
    func pointPressed(point: String) {
        topCurrencyView.textField.text?.append(point)
        updateValues()
    }
    
    func updateValues(){
        if let value = Double(topCurrencyView.textField.text!){
            viewModel.homeCurrencyValue = value
            bottomCurrencyView.rate = String(viewModel.targetCurrencyValue)
        }
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
    
    func updateViews(view: CurrencyView){
        if view == topCurrencyView {
            view.image = UIImage.init(named: configProvider?.homeCurrency ?? "AUD")
            view.countryCode = configProvider?.homeCurrency
        } else {
            view.image = UIImage.init(named: configProvider?.targetCurrency ?? "AUD")
            view.countryCode = configProvider?.targetCurrency
        }
    }
}
