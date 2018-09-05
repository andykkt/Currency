//
//  ChangeRateViewController.swift
//  Currency
//
//  Created by Chris Lang on 5/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

class ChangeRateViewController: UIViewController {

    @IBOutlet weak var setConversionView: SetConversionView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var configProvider: ConfigProvidable?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let homeValue = configProvider?.homeRate {
            setConversionView.homeCurrencyValue = String(homeValue)
        }
        
        if let targetValue = configProvider?.targetRate {
            setConversionView.targetCurrencyValue = String(targetValue)
        }
        
        setConversionView.homeTextField.delegate = self
        setConversionView.targetTextField.delegate = self
        setConversionView.homeTextField.becomeFirstResponder()
        
        
    }
    
    func buttonCorners(){
        doneButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        cancelButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let homeString = setConversionView.homeTextField.text
        let targetString = setConversionView.targetTextField.text
        
        if let homeValue = Double(homeString!) {
            configProvider?.homeRate = homeValue
        }
        
        if let targetValue = Double(targetString!) {
            configProvider?.targetRate = targetValue
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension ChangeRateViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.borderColor = UIColor.init(named: "tintCurrencyRate")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.borderColor = UIColor.init(named: "backgroundCurrencyTop")
    }
}
