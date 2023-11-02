//
//  CharactersResponse.swift
//  Demo-RickAndMorty
//
//  Created by Patricio Perez on 31/10/2023.
//

import Foundation

struct CharactersResponse: Codable {
    let info: InfoResponse?
    let data: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case data = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        info          = (try? container.decodeIfPresent(InfoResponse.self, forKey: .info)) ?? nil
        data          = (try? container.decodeIfPresent([Character].self, forKey: .data)) ?? nil
    }
    
    init(info: InfoResponse? = nil, data: [Character]? = nil) {
        self.info = info
        self.data = data
    }
}

struct Character: Codable, Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int?
    let name, status, species, type, gender, image, url, created: String?
    let episode: [String]?
    let origin, location: NameUrlResponse?
    
    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, location, image, episode, url, created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id            = (try? container.decodeIfPresent(Int.self, forKey: .id)) ?? nil
        name          = (try? container.decodeIfPresent(String.self, forKey: .name)) ?? nil
        status        = (try? container.decodeIfPresent(String.self, forKey: .status)) ?? nil
        species       = (try? container.decodeIfPresent(String.self, forKey: .species)) ?? nil
        type          = (try? container.decodeIfPresent(String.self, forKey: .type)) ?? nil
        gender        = (try? container.decodeIfPresent(String.self, forKey: .gender)) ?? nil
        origin        = (try? container.decodeIfPresent(NameUrlResponse.self, forKey: .origin)) ?? nil
        location      = (try? container.decodeIfPresent(NameUrlResponse.self, forKey: .location)) ?? nil
        image         = (try? container.decodeIfPresent(String.self, forKey: .image)) ?? nil
        episode       = (try? container.decodeIfPresent([String].self, forKey: .episode)) ?? nil
        url           = (try? container.decodeIfPresent(String.self, forKey: .url)) ?? nil
        created       = (try? container.decodeIfPresent(String.self, forKey: .created)) ?? nil

    }
    
    init(id: Int? = nil, name: String? = nil, status: String? = nil, species: String? = nil, 
         type: String? = nil, gender: String? = nil, origin: NameUrlResponse? = nil, location: NameUrlResponse? = nil,
         image: String? = nil, episode: [String]? = nil, url: String? = nil, created: String? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
