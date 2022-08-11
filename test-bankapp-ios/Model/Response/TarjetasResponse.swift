//
//  TarjetasResponse.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

struct TarjetasResponse: Codable {
    let tarjetas: [Tarjetas]
}

struct Tarjetas: Codable{
    let tarjeta: String?
    let nombre: String?
    let saldo: Double?
    let estado: String?
    let tipo: String?
    let id: Int?
}
