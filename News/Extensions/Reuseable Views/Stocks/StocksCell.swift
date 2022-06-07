//
//  StocksCell.swift
//  News
//
//  Created by Mahmoud El-Melligy on 07/06/2022.
//

import UIKit

class StocksCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var stockTitleLabel: UILabel!
    @IBOutlet weak var stockValueLabel: UILabel!
    
    //MARK:- Propertires
    static let cellIdentifier = "StocksCell"
    static func nib() -> UINib{
        return UINib(nibName: "StocksCell", bundle: nil)
    }
    
    func configure(title : String, value : Double){
        stockTitleLabel.text = title
        stockValueLabel.text = "\(value)"
        if value <= 0{
            stockValueLabel.textColor = .red
        }else {
            stockValueLabel.textColor = .green
        }
        
    }

}
