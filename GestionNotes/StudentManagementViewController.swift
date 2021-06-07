//
//  StudentManagementViewController.swift
//  GestionNotes
//
//  Created by LARHCHIM ISMAIL on 5/25/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class StudentManagementViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var mypick: UIPickerView!
    let lsetudiants = ["akkad","azziz","hamdi","hamzi","ismail","laalja","mehdi","nizar","omar"]

    var nmphoto = ""
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
           
           return 1
           
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return lsetudiants.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return lsetudiants[row]
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          
           nmphoto = lsetudiants[row]
        
           lblimage.image = UIImage(named: nmphoto)
       }
    
    
    @IBOutlet weak var lblimage: UIImageView!
    
    var arr:Etudiant?
    var indice:Int?
    
    let defaults = UserDefaults.standard


    
    @IBOutlet weak var lblnom: UITextField!
    
    
    @IBOutlet weak var lblprenom: UITextField!
    
    
    @IBOutlet weak var lblmodule: UITextField!
    
    
    @IBOutlet weak var lblnote: UITextField!
     
    
    var etdnom = [String]()
    var etdprenom = [String]()
    var etdmodule = [String]()
    var etdnote = [Float]()
    var etdimage = [Data]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lblnom.text = arr?.nom
        lblprenom.text = arr?.prenom
        lblmodule.text = arr?.module
        lblnote.text = String(Float(arr!.note))
        
        nmphoto = lsetudiants[0]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let tabimg = UserDefaults.standard.object(forKey: "etdimage") as! [Data]
        
        lblimage.image = UIImage(data: tabimg[indice!])
           
        
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "select"{
            let rp = segue.destination as! ViewController
            rp.array.insert(Etudiant(nom: lblnom.text!, prenom: lblprenom.text!, module: lblmodule.text!, note: Float(lblnote.text!)!, photo: arr!.photo), at: indice!)
            
        }
    }*/
    
    
    
    
    
    
    @IBAction func ModifyAction(_ sender: Any) {
        
        
        if  ( UserDefaults.standard.object(forKey: "etdimage") != nil ){
            
          self.etdnote = UserDefaults.standard.object(forKey: "etdnote") as! [Float]
          
          self.etdmodule = UserDefaults.standard.object(forKey: "etdmodule") as! [String]
          
          self.etdprenom = UserDefaults.standard.object(forKey: "etdprenom") as! [String]
          
          self.etdnom = UserDefaults.standard.object(forKey: "etdnom") as! [String]
          
          self.etdimage = UserDefaults.standard.object(forKey: "etdimage") as! [Data]

        }

       
            
        self.etdnote[indice!] = Float(lblnote.text!)!
        self.etdmodule[indice!] = lblmodule.text!
        self.etdprenom[indice!] = lblprenom.text!
        self.etdnom[indice!] = lblnom.text!
        self.etdimage[indice!] = (UIImage(named: nmphoto)?.pngData())!
            
        defaults.set(etdnom, forKey: "etdnom")
        defaults.set(etdprenom, forKey: "etdprenom")
        defaults.set(etdmodule, forKey: "etdmodule")
        defaults.set(etdimage,forKey: "etdimage")
        defaults.set(etdnote, forKey: "etdnote")
            
        
    }
    


}
