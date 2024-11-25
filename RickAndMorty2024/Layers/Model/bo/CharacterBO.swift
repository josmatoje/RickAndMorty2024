//
//  CharacterBO.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

// MARK: - CharacterBO
struct CharacterBO: Hashable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: LocationBO
    let location: LocationBO
    let image: URL?
    let episode: [URL?]
    let url: URL?
    let created: Date?
}

//MARK: - Enums
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
}
