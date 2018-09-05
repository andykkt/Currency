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
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryArray.append(Country.init(longTitle: "Australian Dollars", shortTitle: "AUD"))
        countryArray.append(Country.init(longTitle: "United States Dollars", shortTitle: "USD"))
        countryArray.append(Country.init(longTitle: "Canadian Dollars", shortTitle: "CAD"))
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 68
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
        
    }
}
