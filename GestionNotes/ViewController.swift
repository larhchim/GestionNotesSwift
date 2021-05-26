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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=============>",indexPath.row)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tablev.delegate = self
        tablev.dataSource = self

        
        array.append(Etudiant.init(nom: "Rochdi", prenom: "Azziz", module: "IOS", note: 12, photo: (UIImage(named: "azziz")?.pngData())!))
        
        array.append(Etudiant.init(nom: "MALIHY", prenom: "HAMDI", module: "IOS", note: 19, photo: (UIImage(named: "hamdi")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "BOUZIDI", prenom: "KHAOULA", module: "IOS", note: 14, photo: (UIImage(named: "khaoula")?.pngData())!))
        
        array.append(Etudiant.init(nom: "LARHCHIM", prenom: "ISMAIL", module: "IOS", note: 16, photo: (UIImage(named: "ismail")?.pngData())!))
        
        array.append(Etudiant.init(nom: "BENREFAD", prenom: "MEHDI", module: "IOS", note: 17, photo: (UIImage(named: "mehdi")?.pngData())!))
        
        array.append(Etudiant.init(nom: "AKKAD", prenom: "YOUNESS", module: "IOS", note: 13, photo: (UIImage(named: "akkad")?.pngData())!))
        
        array.append(Etudiant.init(nom: "HAMZI", prenom: "MED AMINE", module: "IOS", note: 14, photo: (UIImage(named: "hamzi")?.pngData())!))
        
        array.append(Etudiant.init(nom: "LAALJA", prenom: "NOURREDINE", module: "IOS", note: 17, photo: (UIImage(named: "laalja")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "MOUCHIRE", prenom: "NIZAR", module: "IOS", note: 12, photo: (UIImage(named: "nizar")?.pngData())!))
        
        
        array.append(Etudiant.init(nom: "AADIL", prenom: "NOUHAILA", module: "IOS", note: 16, photo: (UIImage(named: "nouhaila")?.pngData())!))
        
        array.append(Etudiant.init(nom: "BOUNIF", prenom: "OMAR", module: "IOS", note: 15, photo: (UIImage(named: "omar")?.pngData())!))
        
       
        
        
    }
    
    
    


}

struct Etudiant{
    var nom:String
    var prenom:String
    var module:String
    var note:Float
    var photo:Data
}

