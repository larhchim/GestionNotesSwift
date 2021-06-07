//
//  ViewController.swift
//  GestionNotes
//
//  Created by LARHCHIM ISMAIL on 5/25/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var array=[Etudiant]()
    
   let defaults = UserDefaults.standard

    var etdnom = [String]()
        var etdprenom = [String]()
        var etdmodule = [String]()
        var etdnote = [Float]()
        var etdimage = [Data]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
  
    
    @IBOutlet weak var tablev: UITableView!
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! TableCellControllerTableViewCell
        let data = array[indexPath.row]
        cell.dataentry(nm: data.nom, pm: data.prenom, mod: data.module, nt: data.note, image: UIImage(data: data.photo)!)
        return cell
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mdfcell"{
            let rs = segue.destination as! StudentManagementViewController
            rs.indice = tablev.indexPathForSelectedRow!.row
            rs.arr = array[tablev.indexPathForSelectedRow!.row]
            
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tablev.delegate = self
        tablev.dataSource = self
        
        if UserDefaults.standard.object(forKey: "etdnom") == nil {
            defaults.set(etdnom, forKey: "etdnom")

        }
        
        if UserDefaults.standard.object(forKey: "etdnote") == nil {
            defaults.set(etdnote, forKey: "etdnote")

        }
        
        if UserDefaults.standard.object(forKey: "etdprenom") == nil {
                  defaults.set(etdprenom, forKey: "etdprenom")

              }

        if UserDefaults.standard.object(forKey: "etdmodule") == nil {
                  defaults.set(etdmodule, forKey: "etdmodule")

              }

        
        if UserDefaults.standard.object(forKey: "etdimage") == nil {
                  defaults.set(etdimage,forKey: "etdimage")

              }

        
        
        if  ( UserDefaults.standard.object(forKey: "etdimage") != nil ) {
            
            self.etdimage = UserDefaults.standard.object(forKey: "etdimage") as! [Data]
                          
                          self.etdnote = UserDefaults.standard.object(forKey: "etdnote") as!
                              [Float]
                          
                          self.etdmodule = UserDefaults.standard.object(forKey: "etdmodule") as! [String]
                          
                          self.etdprenom = UserDefaults.standard.object(forKey: "etdprenom") as! [String]
                          
                          self.etdnom = UserDefaults.standard.object(forKey: "etdnom") as!
                              [String]
            
            print("taille image ",self.etdimage.count," taille note ",self.etdnote.count," taille module ",self.etdmodule.count," taille prenom",self.etdprenom.count," taille nom",etdnom.count)
                          
                          
                          for i in 0..<etdnote.count {
                              
                              array.append(Etudiant.init(nom: etdnom[i], prenom: etdprenom[i], module: etdmodule[i], note: etdnote[i],photo:  etdimage[i]))
                              
                          }
            
        }

        
       
        
        /*array.append(Etudiant.init(nom: "MALIHY", prenom: "HAMDI", module: "IOS", note: 19,
         photo: (UIImage(named: "hamdi")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "LARHCHIM", prenom: "ISMAIL", module: "IOS", note: 16, photo: (UIImage(named: "ismail")?.pngData())!))
        
        array.append(Etudiant.init(nom: "BENREFAD", prenom: "MEHDI", module: "IOS", note: 17, photo: (UIImage(named: "mehdi")?.pngData())!))
        
        array.append(Etudiant.init(nom: "AKKAD", prenom: "YOUNESS", module: "IOS", note: 17, photo: (UIImage(named: "akkad")?.pngData())!))
        
        array.append(Etudiant.init(nom: "HAMZI", prenom: "MED AMINE", module: "IOS", note: 20, photo: (UIImage(named: "hamzi")?.pngData())!))
        
        array.append(Etudiant.init(nom: "LAALJA", prenom: "NOURREDINE", module: "IOS", note: 17, photo: (UIImage(named: "laalja")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "MOUCHIRE", prenom: "NIZAR", module: "IOS", note: 19.5, photo: (UIImage(named: "nizar")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "BOUNIF", prenom: "OMAR", module: "IOS", note: 16, photo: (UIImage(named: "omar")?.pngData())!))
        */
       
        
        
    }
   
    
    
    
    
    @IBAction func editAction(_ sender: Any) {
        tablev.isEditing = !tablev.isEditing
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdimage.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdnote.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdmodule.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdprenom.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.etdnom.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        defaults.set(etdnom, forKey: "etdnom")
        defaults.set(etdprenom, forKey: "etdprenom")
        defaults.set(etdmodule, forKey: "etdmodule")
        defaults.set(etdimage,forKey: "etdimage")
        defaults.set(etdnote, forKey: "etdnote")
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.array.remove(at: indexPath.row)
            self.etdimage.remove(at: indexPath.row)
            
            self.etdnote.remove(at: indexPath.row)
            
            self.etdmodule.remove(at: indexPath.row)
            
            self.etdprenom.remove(at: indexPath.row)
            
            self.etdnom.remove(at: indexPath.row)
            
            
            self.defaults.set(self.etdnom, forKey: "etdnom")
            self.defaults.set(self.etdprenom, forKey: "etdprenom")
            self.defaults.set(self.etdmodule, forKey: "etdmodule")
            self.defaults.set(self.etdimage,forKey: "etdimage")
            self.defaults.set(self.etdnote, forKey: "etdnote")
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            completionHandler(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
 
}

struct Etudiant{
    var nom:String
    var prenom:String
    var module:String
    var note:Float
    var photo:Data
}

