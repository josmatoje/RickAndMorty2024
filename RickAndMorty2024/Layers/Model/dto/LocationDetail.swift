//
//  LocationDetail.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 6/11/24.
//

import Foundation

struct LocationDetailDTO: Codable {
    let id: Int?
    let name: String?
    let planet: String?
    let dimension: String?
    let resident: [String?]?
    let url: String?
    let created: String?
}
