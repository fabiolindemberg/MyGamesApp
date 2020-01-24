//
//  GameTableViewCell.swift
//  MyGames
//
//  Created by Fabio Estudo on 29/11/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with game: Game) {
        lbTitle.text = game.title ?? ""
        lbConsole.text = game.console?.name ?? ""
        
        let image = game.cover as? UIImage
        ivCover.image = image != nil ? image! : UIImage(named: "noCover")
     
        ivFavorite.image = game.favorite ? UIImage(named: "starOn") : UIImage(named: "starOff")
    }
}
