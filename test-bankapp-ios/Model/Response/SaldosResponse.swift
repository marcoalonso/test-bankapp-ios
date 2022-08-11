//
//  SaldosResponse.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

struct SaldosResponse: Codable{
    let saldos: [Saldos]
}

struct Saldos: Codable{
    let cuenta: Int64?
    let saldoGeneral: Double?
    let ingresos: Double?
    let gastos: Double?
    let id: Int?
}
