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
    
    // MARK: - Variables
    let subrayadoButton: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saldosCollectionView.delegate = self
        saldosCollectionView.dataSource = self
        saldosCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        configureUI()
    }
    
    func configureUI(){
        
        //collectionView
        if let layout = saldosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        //ButtonStyle
        let attributeStringCuentas = NSMutableAttributedString(string: "Mis Cuentas", attributes: subrayadoButton)
        let attributeStringEnviar = NSMutableAttributedString(string: "Enviar Dinero", attributes: subrayadoButton)
        let attributeStringAgregar = NSMutableAttributedString(string: "+ Agregar una tarjeta de débito o crédito", attributes: subrayadoButton)
        MisCuentasButton.setAttributedTitle(attributeStringCuentas, for: .normal)
        EnviarDineroButton.setAttributedTitle(attributeStringEnviar, for: .normal)
        agregarTarjetaButton.setAttributedTitle(attributeStringAgregar, for: .normal)
    }

}

extension TarjetasViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 243, height: 125)
    }
    
}
