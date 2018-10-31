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
    var searchCountry = [Country]()
    var searching = false
    var identifier: String?
    
    var configProvider: ConfigProvidable?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var currencySearchBar: UISearchBar!
    
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
        countryArray.append(Country.init(longTitle: "Danish Krone", shortTitle: "DKK"))
        countryArray.append(Country.init(longTitle: "Hong Kong Dollar", shortTitle: "HKD"))
        countryArray.append(Country.init(longTitle: "Hungarian Forint", shortTitle: "HUF"))
        countryArray.append(Country.init(longTitle: "Icelandic Króna", shortTitle: "ISK"))
        countryArray.append(Country.init(longTitle: "Indian Rupee", shortTitle: "INR"))
        countryArray.append(Country.init(longTitle: "Indonesian Rupiah", shortTitle: "IDR"))
        countryArray.append(Country.init(longTitle: "Japanese Yen", shortTitle: "JPY"))
        countryArray.append(Country.init(longTitle: "New Zealand Dollar", shortTitle: "NZD"))
        countryArray.append(Country.init(longTitle: "Polish Złoty", shortTitle: "PLN"))
        countryArray.append(Country.init(longTitle: "Qatari Riyal", shortTitle: "QAR"))
        countryArray.append(Country.init(longTitle: "Russian Ruble", shortTitle: "RUB"))
        countryArray.append(Country.init(longTitle: "Singapore Dollar", shortTitle: "SGD"))
        countryArray.append(Country.init(longTitle: "South African Rand", shortTitle: "ZAR"))
        countryArray.append(Country.init(longTitle: "Sri Lankan Rupee", shortTitle: "LKR"))
        countryArray.append(Country.init(longTitle: "Swedish Krona", shortTitle: "SEK"))
        countryArray.append(Country.init(longTitle: "Swiss Franc", shortTitle: "CHF"))
        countryArray.append(Country.init(longTitle: "Thai Baht", shortTitle: "THB"))
        countryArray.append(Country.init(longTitle: "United Arab Emirates Dirham", shortTitle: "AED"))
        countryArray.append(Country.init(longTitle: "United Kingdom Pound", shortTitle: "GBP"))
        
        countryArray = countryArray.sorted {$0.longTitle < $1.longTitle }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 68
        currencySearchBar.delegate = self
        
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
        if searching {
            return searchCountry.count
        } else {
           return countryArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        
        if searching {
            cell.flag = UIImage.init(named: searchCountry[indexPath.row].shortTitle)
            cell.longTitle = searchCountry[indexPath.row].longTitle
            cell.shortTitle = searchCountry[indexPath.row].shortTitle
        } else {
            cell.flag = UIImage.init(named: countryArray[indexPath.row].shortTitle)
            cell.longTitle = countryArray[indexPath.row].longTitle
            cell.shortTitle = countryArray[indexPath.row].shortTitle
        }
        
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

extension CurrencySelectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = countryArray.filter{$0.longTitle.prefix(searchText.count) == searchText || $0.shortTitle.prefix(searchText.count) == searchText}
        searching = true
        tableView.reloadData()
    }
}
