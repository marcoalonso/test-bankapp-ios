//
//  Double+Extension.swift
//  test-bankapp-ios
//
//  Created by marco rodriguez on 11/08/22.
//

import Foundation
extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
