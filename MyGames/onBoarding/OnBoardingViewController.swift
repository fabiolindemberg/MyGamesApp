//
//  OnBoardingViewController.swift
//  MyGames
//
//  Created by Fábio Pereira on 28/12/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var onDismissOnBoard: (()->Void)?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        onDismissOnBoard?()
    }
    
    func fillOnBoardingInfo(image: UIImage, mainText: String, detailText: String) {
        activityIndicator.stopAnimating()
        backgroundImage.image = image
        mainTextLabel.text = mainText
        detailTextLabel.text = detailText
    }
    
}
