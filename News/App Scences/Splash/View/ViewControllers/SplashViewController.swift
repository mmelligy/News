//
//  ViewController.swift
//  News
//
//  Created by Mahmoud El-Melligy on 06/06/2022.
//

import UIKit
import MaterialComponents.MaterialProgressView
import RxSwift


class SplashViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var progressViewContainer: UIView!
    
    //MARK:- Propertires
    let progressView = MDCProgressView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createProgressBar()
    }
    
    //MARK:- Progress Bar
    func createProgressBar() {
        let progressViewHeight = CGFloat(2)
        progressView.progress = 0.0
        progressView.progressTintColor = UIColor.white
        progressView.frame = CGRect(x: 0, y: progressViewContainer.bounds.height - progressViewHeight, width: progressViewContainer.bounds.width, height: progressViewHeight)
        progressViewContainer.addSubview(progressView)
    }



}

