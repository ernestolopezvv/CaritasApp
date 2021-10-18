//
//  ArticulosTableViewCell.swift
//  CaritasApp
//
//  Created by Erick Solis Mahl on 17/10/21.
//

import UIKit

class ArticulosTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var descripcionArticuloLabel: UILabel!
    @IBOutlet weak var catidadArtiucloLabel: UILabel!
    @IBOutlet weak var imagenArtinculoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
