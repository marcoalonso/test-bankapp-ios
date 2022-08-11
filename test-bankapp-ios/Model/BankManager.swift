//
//  BankManager.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation

protocol cuentaProtocol{
    func mostrarDatos(cuenta: [Cuenta])
}

protocol saldosProtocol{
    func mostrarDatos(saldos: [Saldos])
}

protocol tarjetasProtocol{
    func mostrarDatos(tarjetas: [Tarjetas])
}

protocol movimientosProtocol{
    func mostrarDatos(movimientos: [Movimientos])
}



struct BankManager {
    var delegadoCuenta: cuentaProtocol?
    var delegadoSaldos: saldosProtocol?
    var delegadoTarjetas: tarjetasProtocol?
    var delegadoMovimientos: movimientosProtocol?
    
    func consultarInformacionMovimientos(endPoint: String){
        if let url = URL(string: endPoint){
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if let safeData = datos {
                    if let datosMovimientos = self.parseJSONMovimientos(data: safeData) {
                        delegadoMovimientos?.mostrarDatos(movimientos: datosMovimientos)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func parseJSONMovimientos(data: Data) -> [Movimientos]? {
        var datosMovimientos: [Movimientos] = []
        let decoder = JSONDecoder()
        
        do {
            let datosDecodificados = try decoder.decode(MovimientosResponse.self, from: data)
            print("Decodificacion Exitosa", datosDecodificados)
            
            datosMovimientos = datosDecodificados.movimientos
            return datosMovimientos
            
        } catch {
            print("Error al decodificar: \(error.localizedDescription)")
            return nil
        }
    }
    
    func consultarInformacionTarjetas(endPoint: String){
        if let url = URL(string: endPoint){
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if let safeData = datos {
                    if let datosTarjetas = self.parseJSONTarjetas(data: safeData) {
                        delegadoTarjetas?.mostrarDatos(tarjetas: datosTarjetas)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func parseJSONTarjetas(data: Data) -> [Tarjetas]? {
        var datosTarjetas: [Tarjetas] = []
        let decoder = JSONDecoder()
        
        do {
            let datosDecodificados = try decoder.decode(TarjetasResponse.self, from: data)
            print("Decodificacion Exitosa", datosDecodificados)
            
            datosTarjetas = datosDecodificados.tarjetas
            return datosTarjetas
            
        } catch {
            print("Error al decodificar: \(error.localizedDescription)")
            return nil
        }
    }
    
    func consultarInformacionSaldos(endPoint: String){
        if let url = URL(string: endPoint){
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if let safeData = datos {
                    if let datosSaldos = self.parseJSONSaldos(data: safeData) {
                        delegadoSaldos?.mostrarDatos(saldos: datosSaldos)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func parseJSONSaldos(data: Data) -> [Saldos]? {
        var datosSaldos: [Saldos] = []
        let decoder = JSONDecoder()
        
        do {
            let datosDecodificados = try decoder.decode(SaldosResponse.self, from: data)
            print("Decodificacion Exitosa", datosDecodificados)
            
            datosSaldos = datosDecodificados.saldos
            return datosSaldos
            
        } catch {
            print("Error al decodificar: \(error.localizedDescription)")
            return nil
        }
    }
    
    func consultarInformacionCuenta(endPoint: String){
        if let url = URL(string: endPoint){
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if let safeData = datos {
                    if let datosCuenta = self.parseJSONCuenta(data: safeData) {
                        delegadoCuenta?.mostrarDatos(cuenta: datosCuenta)
                    }
                }
            }
            tarea.resume()
        }
    }
    
//    func parseJSON<T>(data: T) -> T {
//
//    }
    
    func parseJSONCuenta(data: Data) -> [Cuenta]? {
        var datosCuenta: [Cuenta] = []
        let decoder = JSONDecoder()
        
        do {
            let datosDecodificados = try decoder.decode(CuentaResponse.self, from: data)
            print("Decodificacion Exitosa", datosDecodificados)
            
            datosCuenta = datosDecodificados.cuenta
            return datosCuenta
            
        } catch {
            print("Error al decodificar: \(error.localizedDescription)")
            return nil
        }
    }
}
