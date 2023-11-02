//
//  Date+Extensions.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 01/11/2023.
//

import Foundation

extension Date {
    func toString(_ dateFormat: TypeDateFormat = .full) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
}

enum TypeDateFormat: String {
    case full = "dd/MM/yyyy"
    case iso = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}
