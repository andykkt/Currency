//
//  CountryTableViewCell.swift
//  Currency
//
//  Created by Chris Lang on 5/9/18.
//  Copyright © 2018 HoodlesApp. All rights reserved.
//

import UIKit
import AKControls

@IBDesignable class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var currencyLong: UILabel!
    @IBOutlet weak var currencyShort: UILabel!
    
    
    @IBInspectable var flag : UIImage? {
        didSet{ countryFlag.image = flag ?? UIImage.init(named: "AUD")}
    }
    
    @IBInspectable var longTitle : String? {
        didSet{ currencyLong.text = longTitle }
    }

    @IBInspectable var shortTitle : String? {
        didSet{ currencyShort.text = shortTitle }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
