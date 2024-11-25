//
//  UIDeviceExtension.swift
//  RickAndMorty2024
//
//  Created by Jose Maria Mata on 6/11/24.
//

import SwiftUI

extension UIDevice {
    
    static var topInsetSize: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .safeAreaInsets.top ?? 0
    }
    
    static var botomInsetSize: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .safeAreaInsets.bottom ?? 0
    }
    
}
