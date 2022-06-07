//
//  MoreNewsCell.swift
//  News
//
//  Created by Mahmoud El-Melligy on 07/06/2022.
//

import UIKit

class MoreNewsCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK:- Propertires
    static let cellIdentifier = "MoreNewsCell"
    static func nib() -> UINib{
        return UINib(nibName: "MoreNewsCell", bundle: nil)
    }
    
    func configure(newsTitle : String, image : UIImage, news:String, newsDate:String){
        newsTitleLabel.text = newsTitle
        newsImage.image = image
        newsLabel.text = news
        dateLabel.text = newsDate
    }

}
