//
//  CharacterMapper.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

extension CharacterDTO {
    func toBO() -> CharacterBO? {
        return CharacterBO(dto: self)
    }
}

extension CharacterBO {
    init?(dto: CharacterDTO) {
        guard let id = dto.id else {
            return nil
        }
        self.id = id
        self.name = dto.name ?? "Unknown"
        switch dto.status {
        case  "Alive":
            self.status = .alive
        case "Dead":
            self.status = .dead
        default:
            self.status = .unknown
        }
        self.species = dto.species ?? "Unknown"
        self.type = dto.type == "" ? "-" : dto.type ?? "Unknown"
        switch dto.gender {
        case "Female":
            self.gender = .female
        case "Male":
            self.gender = .male
        case "Genderless":
            self.gender = .genderless
        default:
            self.gender = .unknown
        }
        self.origin = dto.origin?.toBO() ?? LocationBO()
        self.location = dto.location?.toBO() ?? LocationBO()
        self.image = URL(string: dto.image ?? "")
        //URL casting
        self.episode = dto.episode?.compactMap({ URL(string: $0) }) ?? []
        self.url = URL(string: dto.url ?? "")
        //Date casting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self.created = dateFormatter.date(from: dto.created ?? "")
    }
}
