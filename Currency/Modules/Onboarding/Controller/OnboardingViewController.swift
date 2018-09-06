//
//  OnboardingViewController.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Dependency
    
    var configProvider: ConfigProvidable?
    
    // MARK: - View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpGetStarted(_ sender: Any) {
        // TODO: this is just test, need to implement onboarding process
        configProvider?.isOnboardingFinished = true
        //dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOnboardingHomeCurrency"{
            let destinationVC = segue.destination as! CurrencySelectionViewController
            configProvider?.isOnboardingFinished = true
            destinationVC.identifier = segue.identifier
            destinationVC.configProvider = configProvider
        }
    }
    
}
