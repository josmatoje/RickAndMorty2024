//
//  RemoteImage.swift
//  RickAndMorty
//
//  Created by Jose Maria Mata on 25/4/24.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: URL?) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
                .aspectRatio(contentMode: .fit)
        }
    }
}
