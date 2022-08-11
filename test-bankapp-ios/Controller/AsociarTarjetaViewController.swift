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
        
    }
    
    @IBAction func cancelarButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
