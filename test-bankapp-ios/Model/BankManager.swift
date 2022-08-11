//
//  BankManager.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

protocol cuentaProtocol{
    func mostrarDatos(cuenta: [Cuenta])
    func errorCuenta(cual: Error)
}

protocol saldosProtocol{
    func mostrarDatos(saldos: [Saldos])
    func errorSaldos(cual: Error)
}

protocol tarjetasProtocol{
    func mostrarDatos(tarjetas: [Tarjetas])
    func errorTarjetas(cual: Error)
}

protocol movimientosProtocol{
    func mostrarDatos(movimientos: [Movimientos])
    func errorMovimientos(cual: String)
}



struct BankManager {
    var delegadoCuenta: cuentaProtocol?
    var delegadoSaldos: saldosProtocol?
    var delegadoTarjetas: tarjetasProtocol?
    var delegadoMovimientos: movimientosProtocol?
    
    func getMovimientos(endPoint: String) {
        var datosMovimientos: [Movimientos] = []
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if error != nil {
                delegadoMovimientos?.errorMovimientos(cual: "\(error!.localizedDescription)")
            }
            
            guard let data = data, error == nil else { return }
            
            do {
                let movimientos = try JSONDecoder().decode(MovimientosResponse.self, from: data)
                datosMovimientos = movimientos.movimientos
                delegadoMovimientos?.mostrarDatos(movimientos: datosMovimientos)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    

    func getTarjetas(endPoint: String) {
        var datosTarjetas: [Tarjetas] = []
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let tarjetas = try JSONDecoder().decode(TarjetasResponse.self, from: data)
                datosTarjetas = tarjetas.tarjetas
                delegadoTarjetas?.mostrarDatos(tarjetas: datosTarjetas)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getSaldos(endPoint: String) {
        var datosSaldos: [Saldos] = []
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let saldos = try JSONDecoder().decode(SaldosResponse.self, from: data)
                datosSaldos = saldos.saldos
                delegadoSaldos?.mostrarDatos(saldos: datosSaldos)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getCuentaInfo(endPoint: String) {
        var datosCuenta: [Cuenta] = []
        guard let url = URL(string: endPoint) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                let cuenta = try JSONDecoder().decode(CuentaResponse.self, from: data)
                datosCuenta = cuenta.cuenta
                delegadoCuenta?.mostrarDatos(cuenta: datosCuenta)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
