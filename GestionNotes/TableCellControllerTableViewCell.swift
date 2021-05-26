//
//  TableCellControllerTableViewCell.swift
//  GestionNotes
//
//  Created by LARHCHIM ISMAIL on 5/25/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class TableCellControllerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nom: UILabel!
    
    
    @IBOutlet weak var prenom: UILabel!
    
    
    @IBOutlet weak var module: UILabel!
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var note: UILabel!
    
    func dataentry(nm:String,pm:String,mod:String,nt:Float,image:UIImage){
        
        nom.text = nm
        prenom.text = pm
        module.text = mod
        note.text = String(format: "%.2f", nt)
        img.image = image
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
