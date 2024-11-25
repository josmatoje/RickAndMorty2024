//
//  EpisodeBO.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

struct EpisodeBO: Hashable, Identifiable {
    let id: Int
    let name: String
    let airDate: Date?
    let episode: String
    let characters: [URL?]
    let url: URL?
    let created: Date?
}
