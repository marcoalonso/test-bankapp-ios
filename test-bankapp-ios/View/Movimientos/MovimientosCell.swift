//
//  MovimientosCell.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 10/08/22.
//

import UIKit

class MovimientosCell: UITableViewCell {
    
    @IBOutlet weak var fechaMovimientoLabel: UILabel!
    @IBOutlet weak var descripcionMovimientoLabel: UILabel!
    @IBOutlet weak var cantidadMovimientoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
