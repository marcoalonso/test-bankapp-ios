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
    
    @IBOutlet weak var nombreUsuarioLabel: UILabel!
    @IBOutlet weak var ultimoInicioLabel: UILabel!
    
    
    // MARK: - Variables
    let subrayadoButton: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
    var saldos: [Saldos] = [Saldos(cuenta: 1, saldoGeneral: 100, ingresos: 500, gastos: 300, id: 1)]
    var tarjetas: [Tarjetas] = []
    var movimientos: [Movimientos] = []
    
    var bankManager = BankManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegados()
       
        configureUI()
        
    }
    
  
    
    func delegados(){
        bankManager.delegadoCuenta = self
        bankManager.consultarInformacionCuenta(endPoint: Endpoints.urlCuenta)
        
        bankManager.delegadoSaldos = self
        bankManager.consultarInformacionSaldos(endPoint: Endpoints.urlSaldos)
        
        bankManager.delegadoTarjetas = self
        bankManager.consultarInformacionTarjetas(endPoint: Endpoints.urlTarjetas)
        
        bankManager.delegadoMovimientos = self
        bankManager.consultarInformacionMovimientos(endPoint: Endpoints.urlMovimientos)
        
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

extension TarjetasViewController: movimientosProtocol {
    func mostrarDatos(movimientos: [Movimientos]) {
        self.movimientos = movimientos
        DispatchQueue.main.async {
            self.tablaMovimientos.reloadData()
        }
    }
}

extension TarjetasViewController: tarjetasProtocol {
    func mostrarDatos(tarjetas: [Tarjetas]) {
        self.tarjetas = tarjetas
        DispatchQueue.main.async {
            self.tablaTarjetas.reloadData()
        }
    }
}

extension TarjetasViewController: cuentaProtocol {
    func mostrarDatos(cuenta: [Cuenta]) {
        DispatchQueue.main.async {
            //Actualizar los labels
            self.nombreUsuarioLabel.text = cuenta[0].nombre
            self.ultimoInicioLabel.text = cuenta[0].ultimaSesion
        }
    }
}

extension TarjetasViewController: saldosProtocol {
    func mostrarDatos(saldos: [Saldos]) {
        self.saldos = saldos
        DispatchQueue.main.async {
            self.saldosCollectionView.reloadData()
        }
    }
    
    
}

extension TarjetasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tablaTarjetas:
            return tarjetas.count
        case tablaMovimientos:
            return movimientos.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView{
        case tablaTarjetas:
            let celda = tablaTarjetas.dequeueReusableCell(withIdentifier: "tarjeta", for: indexPath) as! TarjetaCell
            
            if tarjetas[indexPath.row].estado == "activa" {
                celda.tarjetaImageView.image =  UIImage(named: "activa-card")
            } else {
                celda.tarjetaImageView.image =  UIImage(named: "inactiva-card")
            }
            
            celda.activaInactivaLabel.text = tarjetas[indexPath.row].estado?.localizedCapitalized
            
            let saldoFormato = tarjetas[indexPath.row].saldo ?? 0.0
            celda.cantidadDineroLabel.text = "$ \(saldoFormato.withCommas())"
            celda.numTarjetaLabel.text = tarjetas[indexPath.row].tarjeta
            celda.nombreTitularTarjetaLabel.text = tarjetas[indexPath.row].nombre
            celda.TitularLabel.text = tarjetas[indexPath.row].tipo?.localizedCapitalized
            return celda
            
        case tablaMovimientos:
            let celda = tablaMovimientos.dequeueReusableCell(withIdentifier: "movimientos", for: indexPath) as! MovimientosCell
            celda.descripcionMovimientoLabel.text = movimientos[indexPath.row].descripcion
            celda.fechaMovimientoLabel.text = movimientos[indexPath.row].fecha
            celda.cantidadMovimientoLabel.text = movimientos[indexPath.row].monto
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
        
            let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        print("IndexPath: \(indexPath)")
        
        switch indexPath.row {
            case 0:
            //    let saldoFormato = String(format: "%d", locale: Locale.current, saldos[0].saldoGeneral ?? 0)
            let saldoGeneral = saldos[0].saldoGeneral ?? 0
            celda.cantidadSaldoLabel.text = " $ \(saldoGeneral.withCommas())"
                celda.saldoIngresosLabel.text = "Saldo general en cuentas"
                return celda
            case 1:
            let ingreso = saldos[0].ingresos ?? 0
            celda.cantidadSaldoLabel.text = " $ \(ingreso.withCommas())"
                celda.saldoIngresosLabel.text = "Total de ingresos"
                return celda
            default:
                celda.cantidadSaldoLabel.text = " $ \(saldos[0].saldoGeneral ?? 0)"
                celda.saldoIngresosLabel.text = "Saldo general en cuentas"
                return celda
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


