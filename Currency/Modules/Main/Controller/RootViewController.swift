//
//  RootViewController.swift
//  Currency
//
//  Created by Andy Kim on 13/8/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls

class RootViewController: UIViewController, SegueHandlerType {
    
    // MARK: - Dependency
    
    var configProvider: ConfigProvidable = ConfigProvider()
    
    // MARK: - Definitions
    
    enum SegueIdentifier: String {
        case onboarding
        case main
    }

    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if configProvider.isOnboardingFinished {
            performSegue(.main, sender: nil)
        } else {
            performSegue(.onboarding, sender: nil)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segueIdentifier(forIdentifier: segue.identifier)
            else { return }
        switch segueIdentifier {
        case .onboarding:
            let destinationNavigationController = segue.destination as! UINavigationController
            if let destinationVC = destinationNavigationController.topViewController as? OnboardingViewController {
                destinationVC.configProvider = configProvider
            }
        case .main:
            if let viewController = segue.destination as? MainViewController {
                viewController.configProvider = configProvider
            }
        }
    }

}
