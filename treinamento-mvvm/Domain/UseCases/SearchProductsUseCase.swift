//
//  SearchProductsUseCase.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

func filterProducts(searchText: String, products: [Product]) -> [Product] {
    if searchText.isEmpty {
        return products
    } else {
        return products.filter { product in
            return product.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}
