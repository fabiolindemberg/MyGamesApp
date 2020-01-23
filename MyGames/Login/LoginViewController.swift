//
//  LoginViewController.swift
//  MyGames
//
//  Created by Fabio Pereira on 23/01/20.
//  Copyright © 2020 Fabio Estudo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.setupOnBoarding()
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.horizontalSizeClass == .regular || newCollection.horizontalSizeClass == .compact {
            let viewController = LoginLandscapeViewController(nibName: "LoginLandscapeViewController", bundle: nil)
            self.present(viewController, animated: true)
        }
    }
    
    private func setupOnBoarding() {
        
        let onBoardingStoryBoard = UIStoryboard(name: "OnBoardingCollectionView", bundle: nil)
        let onBoardingViewController = onBoardingStoryBoard.instantiateInitialViewController() as! OnBoardingCollectionViewController
        onBoardingViewController.itens = OnBoardingInfo.getOnboardingInfo()
        self.present(onBoardingViewController, animated: true)

    }
    
    
    @IBAction func btnLoginClick(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let tavBarViewController = mainStoryBoard.instantiateInitialViewController() as! TabBarViewController
        self.present(tavBarViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
