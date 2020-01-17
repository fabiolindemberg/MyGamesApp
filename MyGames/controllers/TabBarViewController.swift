//
//  TabBarViewController.swift
//  MyGames
//
//  Created by Fábio Pereira on 28/12/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.setupOnBoarding()
        }
        
    }

    private func showAlert() {
        let alertController = UIAlertController(title: "Welcome", message: "Você concluio o proceso!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func setupOnBoarding() {
        
        let onBoardingStoryBoard = UIStoryboard(name: "OnBoardingCollectionView", bundle: nil)
        let onBoardingViewController = onBoardingStoryBoard.instantiateInitialViewController() as! OnBoardingCollectionViewController
        self.present(onBoardingViewController, animated: true) 
//        onBoardingViewController.onDismissOnBoard = {
//            self.showAlert()
//        }
//
//        self.present(onBoardingViewController, animated: true) {
//            let mainText = "Este aplicativo permite você administrar todos os seus jogos e fases ao longo do tempo!"
//            let detailText = "Divirta-se e compartilhe com seus amigos!"
//            onBoardingViewController.fillOnBoardingInfo(image: #imageLiteral(resourceName: "joystick"), mainText: mainText, detailText: detailText)
//        }
    }
}
