//
//  LoginLandscapeViewController.swift
//  MyGames
//
//  Created by Fabio Pereira on 23/01/20.
//  Copyright © 2020 Fabio Estudo. All rights reserved.
//

import UIKit

class LoginLandscapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.verticalSizeClass == .regular {
            dismiss(animated: true, completion: nil)

            let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            present(viewController, animated: true, completion: nil)
        }

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
