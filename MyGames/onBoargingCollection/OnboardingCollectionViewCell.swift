//
//  OnboardingCollectionViewCell.swift
//  Challenge
//
//  Created by Fabio Estudo on 29/11/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(item: OnBoardingInfo) {
        titleLabel.text = item.title
        descriptionLabel.text = item.descriptionText
        backgroundImage.image = item.image
    }
}
