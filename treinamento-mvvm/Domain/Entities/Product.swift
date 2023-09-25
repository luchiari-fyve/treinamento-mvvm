//
//  Product.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

struct Product: Decodable {
    let id: String
    let image: String
    let name: String
    let sizes: [String]
    let category: String
    let description: String
    let price: Double
}
