//
//  CharacterDTO.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: LocationDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}


