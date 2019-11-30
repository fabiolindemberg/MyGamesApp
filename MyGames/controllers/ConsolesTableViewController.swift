//
//  ConsolesTableViewController.swift
//  MyGames
//
//  Created by Fabio Estudo on 29/11/19.
//  Copyright © 2019 Fabio Estudo. All rights reserved.
//

import UIKit

class ConsolesTableViewController: UITableViewController {

    let consolesManager = ConsolesManager.shared

    fileprivate func loadConsoles() {
        consolesManager.loadConsoles(with: context)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStatusBarBackgroudColorWhenIOS13(color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadConsoles()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return consolesManager.consoles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let console = consolesManager.consoles[indexPath.row]
        cell.textLabel?.text = console.name
        cell.imageView?.image = console.image as? UIImage
        return cell
    }
    
//    private func showAlert(with console: Console?) {
//        let title = console == nil ? "Adicionar" : "Editar"
//        let alert = UIAlertController(title: title + " plataforma", message: nil, preferredStyle: .alert)
//
//        alert.addTextField(configurationHandler: { (textField) in
//            textField.placeholder = "Nome da plataforma"
//
//            if let name = console?.name {
//                textField.text = name
//            }
//        })
//
//        alert.addAction(UIAlertAction(title: title, style: .default, handler: {(action) in
//            let console = console ?? Console(context: self.context)
//            console.name = alert.textFields?.first?.text
//            do {
//                try self.context.save()
//                self.loadConsoles()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }))
//
//        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
//        alert.view.tintColor = UIColor(named: "second")
//
//        present(alert, animated: true, completion: nil)
//    }
    
//    @IBAction func addConsole(_ sender: UIBarButtonItem) {
//        showAlert(with: nil)
//    }
//    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let console = consolesManager.consoles[indexPath.row]
         //showAlert(with: console)
        
         // deselecionar atual cell
         tableView.deselectRow(at: indexPath, animated: false)
     }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
         if editingStyle == .delete {
             consolesManager.deleteConsole(index: indexPath.row, context: context)
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
     }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modifyConsoleSegue" {
            if let controller = segue.destination as? ConsoleInputViewController {
                controller.console = consolesManager.consoles[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    

}
