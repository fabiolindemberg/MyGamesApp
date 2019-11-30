//
//  ConsoleViewController.swift
//  MyGames
//
//  Created by Fabio Estudo on 30/11/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit
import Photos

class ConsoleInputViewController: UIViewController {

    @IBOutlet weak var ivConsoleImage: UIImageView!
    @IBOutlet weak var btConsoleImage: UIButton!
    @IBOutlet weak var ftColeseName: UITextField!
    
    var console: Console?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        
        ftColeseName.text = console?.name ?? ""
        if let image = console?.image as? UIImage {
            ivConsoleImage.image = image
        }
    }

    private func selectPicture(sourceType: UIImagePickerController.SourceType) {
        
        //Photos
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    
                    self.chooseImageFromLibrary(sourceType: sourceType)
                    
                } else {
                    
                    print("unauthorized -- TODO message")
                }
            })
        } else if photos == .authorized {
            
            self.chooseImageFromLibrary(sourceType: sourceType)
        }
    }
    
    @objc private func chooseImageFromLibrary(sourceType: UIImagePickerController.SourceType) {
        
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = sourceType
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.navigationBar.tintColor = UIColor(named: "main")
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }

    @IBAction func addOrModifyConsoleImage(_ sender: Any) {
        // para adicionar uma imagem da biblioteca
        print("para adicionar uma imagem da biblioteca")
        
        
        let alert = UIAlertController(title: "Selecinar capa", message: "De onde você quer escolher a capa?", preferredStyle: .actionSheet)
        
         let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default, handler: {(action: UIAlertAction) in
             self.selectPicture(sourceType: .photoLibrary)
         })
         alert.addAction(libraryAction)
        
         let photosAction = UIAlertAction(title: "Album de fotos", style: .default, handler: {(action: UIAlertAction) in
             self.selectPicture(sourceType: .savedPhotosAlbum)
         })
         alert.addAction(photosAction)
        
         let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
         alert.addAction(cancelAction)
        
         present(alert, animated: true, completion: nil)

    }
    
    @IBAction func addEdtConsole(_ sender: Any) {
        
        guard ftColeseName.text ?? "" != "" else {
            ftColeseName.shake()
            return
        }
        
        if console == nil {
            console = Console(context: context)
        }
        console?.name = ftColeseName.text
        console?.image = ivConsoleImage.image
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

extension ConsoleInputViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // tip. implementando os 2 protocols o evento sera notificando apos user selecionar a imagem
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // ImageView won't update with new image
            // bug fixed: https://stackoverflow.com/questions/42703795/imageview-wont-update-with-new-image
            DispatchQueue.main.async {
                self.ivConsoleImage.image = pickedImage
                self.ivConsoleImage.setNeedsDisplay()
                self.btConsoleImage.setTitle(nil, for: .normal)
                self.btConsoleImage.setNeedsDisplay()
            }
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
