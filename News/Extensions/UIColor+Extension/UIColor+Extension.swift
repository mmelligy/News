//
//  UIColor+Extension.swift
//  News
//
//  Created by Mahmoud El-Melligy on 06/06/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static let primaryAppColor = UIColor(named: "AppColor")!
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
