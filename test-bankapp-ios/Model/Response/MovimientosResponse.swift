//
//  MovimientosResponse.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

struct MovimientosResponse : Codable {
    let movimientos: [Movimientos]
}

struct Movimientos: Codable {
    let fecha: String?
    let descripcion: String?
    let monto: String?
    let tipo: String?
    let id: Int?
}
