//
//  CurrencySelectionViewController.swift
//  Currency
//
//  Created by Chris Lang on 5/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit

class CurrencySelectionViewController: UIViewController {

    var countryArray = [Country]()
    var identifier: String?
    
    var configProvider: ConfigProvidable?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton! {
        didSet{
            if identifier == "goToOnboardingHomeCurrency"{
                backButton.isHidden = true
            }
        }
    }
    
    
    lazy var viewModel: CurrencySelectionViewModel = {
        return CurrencySelectionViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryArray.append(Country.init(longTitle: "Australian Dollars", shortTitle: "AUD"))
        countryArray.append(Country.init(longTitle: "United States Dollars", shortTitle: "USD"))
        countryArray.append(Country.init(longTitle: "Canadian Dollars", shortTitle: "CAD"))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 68
        
        if identifier == "goToTargetCurrency"{
            titleLabel.text = "Target Currency"
        }

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if identifier == "goToOnboardingTargetCurrency"{
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOnboardingTargetCurrency"{
            let destinationVC = segue.destination as! CurrencySelectionViewController
            destinationVC.identifier = segue.identifier
            destinationVC.configProvider = configProvider
        } else if segue.identifier == "goToOnboardingSetRate"{
            let destinationVC = segue.destination as! ChangeRateViewController
            destinationVC.identifier = segue.identifier
            destinationVC.configProvider = configProvider
        }
        
    }
    


}

extension CurrencySelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.flag = UIImage.init(named: countryArray[indexPath.row].shortTitle)
        cell.longTitle = countryArray[indexPath.row].longTitle
        cell.shortTitle = countryArray[indexPath.row].shortTitle
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.init(named: "backgroundButton")
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if identifier == "goToHomeCurrency" || identifier == "goToOnboardingHomeCurrency" {
            viewModel.homeCurrency = countryArray[indexPath.row].shortTitle
        } else if identifier == "goToTargetCurrency" || identifier == "goToOnboardingTargetCurrency" {
            viewModel.targetCurrency = countryArray[indexPath.row].shortTitle
        }
    }
}
