//
//  Manager.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

class Manager<T> {
    var delegado: T
    var arrayInfo: T
    
    init(delegado: T, arrayInfo: T){
        self.delegado = delegado
        self.arrayInfo = arrayInfo
    }
    
    func consultarInformacion<T>(data: T) -> T {
       
        return self.arrayInfo as! T
    }
    
}
