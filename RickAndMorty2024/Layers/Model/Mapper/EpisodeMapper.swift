//
//  EpisodeMapper.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

extension EpisodeDTO {
    func toBO() -> EpisodeBO? {
        return EpisodeBO(dto: self)
    }
}

extension EpisodeBO {
    init?(dto: EpisodeDTO) {
        guard let id = dto.id else {
            return nil
        }
        self.id = id
        self.name = dto.name ?? "Unknown"
        //Date casting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        self.airDate = dateFormatter.date(from: dto.air_date ?? "")
        self.episode = dto.episode ?? "Unknown"
        //URL casting
        self.characters = dto.characters?.compactMap({ URL(string: $0) }) ?? []
        self.url = URL(string: dto.url ?? "")
        //Date casting
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self.created = dateFormatter.date(from: dto.created ?? "")
    }
}
