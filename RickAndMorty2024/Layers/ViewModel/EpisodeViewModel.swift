//
//  EpisodeViewModel.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

class EpisodeViewModel: ObservableObject {
    let useCase: RickAndMortyUseCase = RickAndMortyUseCase()
    
    @Published var episodes: [EpisodeBO]?
    @Published var error: Error?
    
    func loadEpisodes(urls: [URL?]) {
        Task {
            do {
                episodes = try await useCase.getEpisodesFromEpisodeList(urls)
            } catch {
                self.error = error
                print(error)
            }
        }
    }
}
