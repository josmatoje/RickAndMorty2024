//
//  RickAndMortyUseCase.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

class RickAndMortyUseCase {
    let repository: RickAndMortyRepository = RickAndMortyRepository()
    
    func getInfoCharactersFrom(_ link: String? = nil) async throws -> (InfoBO, [CharacterBO]) {
        try await repository.getCharacters(link: link)
    }
    func getCharactersFromCharacterPage(_ link: String? = nil) async throws -> [CharacterBO] {
        try await repository.getCharacters(link: link).1
    }
    
    func getEpisodesFromEpisodeList(_ urls: [URL?]) async throws -> [EpisodeBO] {
        try await repository.getEpisodes(urls: urls)
    }
}
