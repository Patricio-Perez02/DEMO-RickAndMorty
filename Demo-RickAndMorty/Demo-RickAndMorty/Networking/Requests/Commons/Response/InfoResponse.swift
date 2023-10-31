//
//  InfoResponse.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

struct InfoResponse: Codable {
    let count, pages: Int?
    let next, prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count, pages, next, prev
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count         = (try? container.decodeIfPresent(Int.self, forKey: .count)) ?? nil
        pages         = (try? container.decodeIfPresent(Int.self, forKey: .pages)) ?? nil
        next          = (try? container.decodeIfPresent(String.self, forKey: .next)) ?? nil
        prev          = (try? container.decodeIfPresent(String.self, forKey: .prev)) ?? nil
    }
    
    init(count: Int? = nil, pages: Int? = nil, next: String? = nil, prev: String? = nil) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
