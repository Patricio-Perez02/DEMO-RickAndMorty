//
//  NameUrlResponse.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

struct NameUrlResponse: Codable, Hashable {
    let name, url: String?
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name          = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? nil
        url           = (try? container.decodeIfPresent(String.self, forKey: .url)) ?? nil
    }
    
    init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
}
