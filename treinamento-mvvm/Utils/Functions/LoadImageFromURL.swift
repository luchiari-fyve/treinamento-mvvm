//
//  LoadImageFromURL.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation
import SwiftUI

func loadImageFromURL(url: URL, completion: @escaping (UIImage?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data, error == nil {
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(uiImage)
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }.resume()
}
