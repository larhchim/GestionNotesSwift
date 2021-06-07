
import UIKit

class AddStudent: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    let defaults = UserDefaults.standard
    
    var etdnom = [String]()
    var etdprenom = [String]()
    var etdmodule = [String]()
    var etdnote = [Float]()
    var etdimage = [Data]()
    
    let lsetudiants = ["akkad","azziz","hamdi","hamzi","ismail","laalja","mehdi","nizar","omar"]
    var nmphoto = ""
    var imagerie:Data?
    
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
        self.imagerie = (UIImage(named: lsetudiants[row])?.pngData())!
        nmphoto = lsetudiants[row]
        lblimage.image = UIImage(named: nmphoto)
    }
    var et:Etudiant?
   
    @IBOutlet weak var lblModule: UITextField!
    
    @IBOutlet weak var lblNom: UITextField!
    
    
    @IBOutlet weak var lblPrenom: UITextField!
    
    @IBOutlet weak var lblNote: UITextField!
    
    
    @IBOutlet weak var lblimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nmphoto = lsetudiants[0]
        
        lblimage.image = UIImage(named: nmphoto)
        
        
      

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblimage.image = UIImage(named: nmphoto)

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "returnAc" ){
            let cs = segue.destination as!ViewController
            if  ( UserDefaults.standard.object(forKey: "etdimage") != nil ){
                self.etdnote = UserDefaults.standard.object(forKey: "etdnote") as!
                    [Float]
                
                self.etdmodule = UserDefaults.standard.object(forKey: "etdmodule") as! [String]
                
                self.etdprenom = UserDefaults.standard.object(forKey: "etdprenom") as! [String]
                
                self.etdnom = UserDefaults.standard.object(forKey: "etdnom") as!
                    [String]
                
                self.etdimage = UserDefaults.standard.object(forKey: "etdimage") as! [Data]
                
            }
            self.etdnom.append(lblNom.text!)
            self.etdprenom.append(lblPrenom.text!)
            self.etdmodule.append(lblModule.text!)
            self.etdnote.append(Float(lblNote.text!)!)
            self.etdimage.append((UIImage(named: nmphoto)?.pngData())!)
            
            defaults.set(etdnom, forKey: "etdnom")
            cs.etdnom = self.etdnom
            defaults.set(etdprenom, forKey: "etdprenom")
            cs.etdprenom = self.etdprenom
            defaults.set(etdmodule, forKey: "etdmodule")
            cs.etdmodule = self.etdmodule
            defaults.set(etdimage,forKey: "etdimage")
            cs.etdimage = self.etdimage
            defaults.set(etdnote, forKey: "etdnote")
            cs.etdnote = self.etdnote
            
           // cs.array.append(et!)
            
        }
    }
    
}
