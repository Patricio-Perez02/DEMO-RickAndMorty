//
//  String+Extension.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 01/11/2023.
//

import Foundation

extension String {
    func toDate(_ dateFormat: TypeDateFormat = .iso) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self) ?? Date()
    }
}
