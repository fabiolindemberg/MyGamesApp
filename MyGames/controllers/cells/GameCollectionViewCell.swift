//
//  CollectionViewCell.swift
//  MyGames
//
//  Created by Fábio Pereira on 24/01/20.
//  Copyright © 2020 Fabio Estudo. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var ivFavorite: UIImageView!
    
    var favoriteClickHandler: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivFavorite.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickHandler)))
        
    }
    
    @objc
    private func clickHandler(gesture: UITapGestureRecognizer) {
        favoriteClickHandler?()
    }
    
    func fill(with game: Game) {
        lbTitle.text = game.title ?? ""
        lbConsole.text = game.console?.name ?? ""
        
        let image = game.cover as? UIImage
        ivCover.image = image != nil ? image! : UIImage(named: "noCover")
     
        ivFavorite.image = game.favorite ? UIImage(named: "starOn") : UIImage(named: "starOff")
    }
}
