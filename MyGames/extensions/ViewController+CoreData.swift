//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Fabio Estudo on 30/11/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
     // propriedade computada que através de uma Extension permite agora que qualquer
     // objeto UIViewController conheça essa propriedade context.
    
     var context: NSManagedObjectContext {
        
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
         // obtem a instancia do Core Data stack
         return appDelegate.persistentContainer.viewContext
     }
    
    func setUpStatusBarBackgroudColorWhenIOS13(color: UIColor) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = color
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    public func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }

}
