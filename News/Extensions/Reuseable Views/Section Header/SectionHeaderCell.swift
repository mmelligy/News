//
//  SectionHeaderCell.swift
//  News
//
//  Created by Mahmoud El-Melligy on 06/06/2022.
//

import UIKit

class SectionHeaderCell: UICollectionReusableView {
    
    //MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Propertires
    static let cellIdentifier = "SectionHeaderCell"
    static func nib() -> UINib{
        return UINib(nibName: "SectionHeaderCell", bundle: nil)
    }
        
    var title: String?{
        didSet {
            titleLabel.text = title
        }
    }
}
