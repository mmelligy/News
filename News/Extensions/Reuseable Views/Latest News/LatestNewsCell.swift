//
//  LatestNewsCell.swift
//  News
//
//  Created by Mahmoud El-Melligy on 07/06/2022.
//

import UIKit

class LatestNewsCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    //MARK:- Propertires
    static let cellIdentifier = "LatestNewsCell"
    static func nib() -> UINib{
        return UINib(nibName: "LatestNewsCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        newsImage.layer.cornerRadius = 10
    }
    
    func configure(newsTitle : String, image : UIImage){
        newsTitleLabel.text = newsTitle
        newsImage.image = image
    }

}
