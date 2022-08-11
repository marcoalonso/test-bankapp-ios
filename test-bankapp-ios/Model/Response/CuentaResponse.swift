//
//  CuentaResponse.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

struct CuentaResponse : Codable {
    let cuenta: [Cuenta]
}

struct Cuenta: Codable{
    let cuenta: Int64?
    let nombre: String?
    let ultimaSesion: String?
    let id: Int?
}
