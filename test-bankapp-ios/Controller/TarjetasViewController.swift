//
//  TarjetasViewController.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 10/08/22.
//

import UIKit

class TarjetasViewController: UIViewController {
    @IBOutlet weak var MisCuentasButton: UIButton!
    @IBOutlet weak var EnviarDineroButton: UIButton!
    @IBOutlet weak var agregarTarjetaButton: UIButton!
    @IBOutlet weak var saldosCollectionView: UICollectionView!
    @IBOutlet weak var tablaTarjetas: UITableView!
    @IBOutlet weak var tablaMovimientos: UITableView!
    
    // MARK: - Variables
    let subrayadoButton: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegados()
       
        configureUI()
    }
    
    func delegados(){
        tablaTarjetas.delegate = self
        tablaTarjetas.dataSource = self
        
        tablaMovimientos.dataSource = self
        tablaMovimientos.delegate = self
        
        saldosCollectionView.delegate = self
        saldosCollectionView.dataSource = self
        saldosCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //collectionView
        if let layout = saldosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        

    }
    
    func configureUI(){
        //TableView
        tablaTarjetas.register(UINib(nibName: "TarjetaCell", bundle: nil), forCellReuseIdentifier: "tarjeta")
        tablaMovimientos.register(UINib(nibName: "MovimientosCell", bundle: nil), forCellReuseIdentifier: "movimientos")
        tablaTarjetas.separatorStyle = .none
        tablaTarjetas.separatorColor = .none
        
        //ButtonStyle
        let attributeStringCuentas = NSMutableAttributedString(string: "Mis Cuentas", attributes: subrayadoButton)
        let attributeStringEnviar = NSMutableAttributedString(string: "Enviar Dinero", attributes: subrayadoButton)
        let attributeStringAgregar = NSMutableAttributedString(string: "+ Agregar una tarjeta de débito o crédito", attributes: subrayadoButton)
        MisCuentasButton.setAttributedTitle(attributeStringCuentas, for: .normal)
        EnviarDineroButton.setAttributedTitle(attributeStringEnviar, for: .normal)
        agregarTarjetaButton.setAttributedTitle(attributeStringAgregar, for: .normal)
    }

}

extension TarjetasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tablaTarjetas:
            return 2
        case tablaMovimientos:
            return 10
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView{
        case tablaTarjetas:
            let celda = tablaTarjetas.dequeueReusableCell(withIdentifier: "tarjeta", for: indexPath) as! TarjetaCell
            celda.tarjetaImageView.image = UIImage(named: "activa-card")
            celda.activaInactivaLabel.text = "Activa"
            celda.cantidadDineroLabel.text = "$1,500.00"
            celda.numTarjetaLabel.text = "4152 3137 0987 0987"
            celda.nombreTitularTarjetaLabel.text = "Marco Alonso Rodriguez"
            celda.TitularLabel.text = "Titular"
            return celda
            
        case tablaMovimientos:
            let celda = tablaMovimientos.dequeueReusableCell(withIdentifier: "movimientos", for: indexPath) as! MovimientosCell
            celda.descripcionMovimientoLabel.text = "UBER BV"
            celda.fechaMovimientoLabel.text = "10/08/2022"
            celda.cantidadMovimientoLabel.text = "- $250.00"
            return celda
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView{
        case tablaTarjetas:
            return 110
        case tablaMovimientos:
            return 50
        default:
            return 100
        }
    }
    
}

extension TarjetasViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case saldosCollectionView:
            return 2
        default:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case saldosCollectionView:
            let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            
            return celda
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case saldosCollectionView:
            return CGSize(width: 243, height: 125)
        default:
            return CGSize(width: 200, height: 50)
            
        }
    }
    
}
