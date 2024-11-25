//
//  TextExtension.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 24/9/24.
//

import SwiftUI

extension Text {
    
    func boldTitleBlack() -> some View {
        self
            .bold()
            .font(Font.title)
            .foregroundColor(Color.blackApp)
    }
    
    func simpleBlack() -> some View {
        self
            .font(.custom("Bradley Hand", size: 20))
            .foregroundColor(.blackApp)
    }
    
    func simpleGray() -> some View {
        self
            .font(.custom("Bradley Hand", size: 20))
            .foregroundColor(Color.gray)
    }
    
    func titleBlack() -> some View {
        self
            .font(.custom("Chalkduster", size: 40, relativeTo: .title))
            .foregroundColor(.blackApp)
            .padding()
    }
    
    func titleClear() -> some View {
        self
            .font(Font.title)
            .foregroundColor(Color.backgroundApp)
            .underline()
            .padding()
    }
    
}
