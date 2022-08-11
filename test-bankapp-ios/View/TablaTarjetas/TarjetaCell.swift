//
//  TarjetaCell.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 10/08/22.
//

import UIKit

class TarjetaCell: UITableViewCell {
    
    @IBOutlet weak var tarjetaImageView: UIImageView!
    @IBOutlet weak var activaInactivaLabel: UILabel!
    
    @IBOutlet weak var TitularLabel: UILabel!
    @IBOutlet weak var nombreTitularTarjetaLabel: UILabel!
    @IBOutlet weak var numTarjetaLabel: UILabel!
    @IBOutlet weak var cantidadDineroLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
