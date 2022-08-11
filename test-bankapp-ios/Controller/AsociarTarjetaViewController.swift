//
//  AsociarTarjetaViewController.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 10/08/22.
//

import UIKit

class AsociarTarjetaViewController: UIViewController {
    
    @IBOutlet weak var saldo: UITextField!
    @IBOutlet weak var marca: UITextField!
    @IBOutlet weak var issure: UITextField!
    @IBOutlet weak var nombreTarjeta: UITextField!
    @IBOutlet weak var numTarjeta: UITextField!
    @IBOutlet weak var cuenta: UITextField!
    @IBOutlet weak var estatus: UITextField!
    
    @IBOutlet weak var tipoCuenta: UITextField!
    
    var formularioJSON: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func agregarButton(_ sender: UIButton) {
        formularioJSON = "{ Numero de tarjeta: \(numTarjeta.text ?? ""), Cuenta: \(cuenta.text ?? ""), Issure: \(issure.text ?? ""), Nombre de tarjeta: \(nombreTarjeta.text ?? ""), Marca: \(marca.text ?? ""), Estatus: \(estatus.text ?? ""), Saldo: \(saldo.text ?? ""), Tipo de cuenta: \(tipoCuenta.text ?? "") }"
                
                
                let alerta = UIAlertController(title: "Datos Tarjeta", message: formularioJSON, preferredStyle: .alert)
                let accionAceptar = UIAlertAction(title: "ACEPTAR", style: .default, handler: nil)
                alerta.addAction(accionAceptar)
                present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func cancelarButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
