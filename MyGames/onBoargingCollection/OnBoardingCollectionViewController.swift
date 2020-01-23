//
//  OnBoardingCollectionViewController.swift
//  MyGames
//
//  Created by Fábio Pereira on 16/01/20.
//  Copyright © 2020 Fabio Estudo. All rights reserved.
//

import UIKit

class OnBoardingCollectionViewController: UIViewController {

    var itens: [OnBoardingInfo] = []
    var complitionHandler: (()->Void)? = nil
    private let reusableIdentifier = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)
        //collectionView.register(UINib(nibName: "OnBoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reusableIdentifier)
        collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        collectionView.isPagingEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        complitionHandler?()
    }

}

extension OnBoardingCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let row = indexPath.row
        cell.fill(item: itens[row])

        return cell
    }
    
}

extension OnBoardingCollectionViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
    //let height = self.view.frame.height * 0.8
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 0
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 0
   }
}

struct OnBoardingInfo {
    let title: String
    let descriptionText: String
    let image: UIImage
    
    static func getOnboardingInfo() -> [OnBoardingInfo] {
        
        var info: [OnBoardingInfo] = []
        
        info.append(OnBoardingInfo(title: "Welcome", descriptionText: "This is the best app I'v made until now!", image: #imageLiteral(resourceName: "wall1")))
        
        info.append(OnBoardingInfo(title: "Welcome", descriptionText: "We home you enjoi it!", image: #imageLiteral(resourceName: "wall2")))
        
        info.append(OnBoardingInfo(title: "Welcome", descriptionText: "Fell free to contact us on our website", image: #imageLiteral(resourceName: "wall1")))
        
        info.append(OnBoardingInfo(title: "Welcome", descriptionText: "This is an aweasome app!", image: #imageLiteral(resourceName: "wall2")))
        
        info.append(OnBoardingInfo(title: "Welcome", descriptionText: "Welcome", image: #imageLiteral(resourceName: "wall1")))

        return info
        
    }
}


