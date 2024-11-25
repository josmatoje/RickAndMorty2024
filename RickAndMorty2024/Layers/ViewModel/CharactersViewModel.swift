//
//  CgaractersViewModel.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    let useCase: RickAndMortyUseCase = RickAndMortyUseCase()
    
    @Published var pageInfo: InfoBO?
    @Published var characters: [CharacterBO]?
    @Published var episodes: [EpisodeBO]?
    @Published var error: Error?
    @Published var searchName: String = ""
    @Published var searching: Bool = true
    
    init() {
        loadCharacters()
    }
    
    func loadCharacters(link: String? = nil) {
        Task {
            do {
                let tuple = try await useCase.getInfoCharactersFrom(link)
                pageInfo = tuple.0
                characters = tuple.1
                searching = false
            } catch {
                self.error = error
                print(error)
            }
        }
    }
    
    func refreshList() {
        Task{
            if searchName != "" {
                try await Task.sleep(nanoseconds: 1000000000)
            }
            let link = "https://rickandmortyapi.com/api/character/?name=\(searchName)"
            loadCharacters(link: link)
        }
    }
    
}
