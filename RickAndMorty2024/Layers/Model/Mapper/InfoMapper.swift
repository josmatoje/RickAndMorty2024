//
//  InfoMapper.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

extension InfoDTO {
    func toBO() -> InfoBO? {
        return InfoBO(dto: self)
    }
}

extension InfoBO {
    init?(dto: InfoDTO) {
        self.count = dto.count ?? 0
        self.pages = dto.pages ?? 0
        self.next = dto.next
        self.prev = dto.prev
    }
}
