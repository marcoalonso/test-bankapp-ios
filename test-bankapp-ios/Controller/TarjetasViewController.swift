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

        delegados()
       
        
        
        configureUI()
    }
    
    func delegados(){
        saldosCollectionView.delegate = self
        saldosCollectionView.dataSource = self
        saldosCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //collectionView
        if let layout = saldosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        

    }
    
    func configureUI(){
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
