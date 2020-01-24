//
//  FavoriteGameListViewController.swift
//  MyGames
//
//  Created by Fábio Pereira on 24/01/20.
//  Copyright © 2020 Fabio Estudo. All rights reserved.
//

import UIKit
import CoreData

class FavoriteGameListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "gameCollectionViewCell"
    var fetchedResultController: NSFetchedResultsController<Game>!

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        loadGames() 
    }
    
    func loadGames() {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
       
        let predicate = NSPredicate(format: "favorite == %@", NSNumber(value: true))
        fetchRequest.predicate = predicate
       
        // possui
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
       
        do {
            try fetchedResultController.performFetch()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameDetailViewController {
            vc.game = fetchedResultController.fetchedObjects?[sender as! Int]
        }
    }
    
}

extension FavoriteGameListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultController?.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameCollectionViewCell
        
        guard let game = fetchedResultController.fetchedObjects?[indexPath.row] else {
           return cell
        }
        
        cell.fill(with: game)
        
        cell.favoriteClickHandler = { [weak self] in
            do {
                game.favorite = !game.favorite
                try self?.context.save()
                cell.fill(with: game)
                self?.loadGames()
            } catch {
                print(error)
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gameSegue", sender: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.47, height: 210)
    }
    
}


extension FavoriteGameListViewController: NSFetchedResultsControllerDelegate {
   
    // sempre que algum objeto for modificado esse metodo sera notificado
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
       collectionView.reloadData()
    }
}
