//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Jose Maria Mata on 25/4/24.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var url: URL?
    private var key: String
    private var task: URLSessionDataTask?

    init(url: URL?) {
        self.url = url
        self.key = url?.absoluteString ?? "placeholder"
        loadImage()
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.get(forKey: key) {
            self.image = cachedImage
        } else {
            
            if let url {
                task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        if let image {
                            self.image = image
                            ImageCache.shared.set(image, forKey: self.key)
                        }
                    }
                }
                task?.resume()
                
            } else {
                self.image = UIImage(named: "placeHolder")
                if let image {
                    ImageCache.shared.set(image, forKey: self.key)
                }
            }
            
        }
    }
}
