//
//  Locationmapper.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

extension LocationDTO {
    func toBO() -> LocationBO? {
        return LocationBO(dto: self)
    }
}

extension LocationBO {
    init() {
        self.name = ""
        self.url = URL(string: "")
    }
    
    init?(dto: LocationDTO) {
        self.name = dto.name ?? ""
        self.url = URL(string: dto.url ?? "")
    }
}
