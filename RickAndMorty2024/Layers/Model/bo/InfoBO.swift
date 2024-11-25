//
//  InfoBO.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 23/9/24.
//

import Foundation

struct InfoBO {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    init() {
        self.count = 0
        self.pages = 0
        self.next = nil
        self.prev = nil
    }
}

