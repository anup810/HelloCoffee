//
//  NumberFormatterExtension.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-08-22.
//

import Foundation

extension NumberFormatter{
    static var currency : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
