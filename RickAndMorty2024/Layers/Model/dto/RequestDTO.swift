//
//  RequestDTO.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

struct PageRequestDTO<T: Codable>: Codable {
    let info: InfoDTO?
    let results: [T]?
}
