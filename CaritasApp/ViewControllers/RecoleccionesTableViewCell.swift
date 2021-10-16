//
//  RecoleccionesTableViewCell.swift
//  CaritasApp
//
//  Created by Erick Solis Mahl on 16/10/21.
//

import UIKit

class RecoleccionesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fechaDonacionLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var cantidadArticulosLabel: UILabel!
    
    @IBOutlet weak var almacenDestiniLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
