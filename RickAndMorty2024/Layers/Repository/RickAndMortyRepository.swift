//
//  RickAndMortyRepository.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

class RickAndMortyRepository {
    let session = URLSession.shared
    
    func getCharacters(link: String?) async throws -> (InfoBO, [CharacterBO]) {
        let urlString = link ?? "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { throw ErrorApp.invalidUrl }
       
        let result = try await session.data(from: url)
        let request = try JSONDecoder().decode(PageRequestDTO<CharacterDTO>.self, from: result.0)
        
        return (request.info?.toBO() ?? InfoBO(), request.results?.compactMap({ $0.toBO()}) ?? [])
    }
    
//    func getCharacters(link: String?) async throws -> (InfoBO, [CharacterBO]) {
//        let urlString = link ?? "https://rickandmortyapi.com/api/character"
//        guard let url = URL(string: urlString) else { throw ErrorApp.invalidUrl }
//       
//        let result = try await session.data(from: url)
//        let request = try JSONDecoder().decode(PageRequestDTO<CharacterDTO>.self, from: result.0)
//        
//        return (request.info?.toBO() ?? InfoBO(), request.results?.compactMap({ $0.toBO()}) ?? [])
//    }
    
    func getEpisodes(urls: [URL?]) async throws -> [EpisodeBO] {
        var episodes: [EpisodeBO] = []
        for url in urls {
            
            guard let url else { throw ErrorApp.invalidUrl }
           
            let result = try await session.data(from: url)
            let request = try JSONDecoder().decode(EpisodeDTO.self, from: result.0)
            if let request = request.toBO() {
                episodes.append(request)
            }
        }
        return episodes
    }
}

