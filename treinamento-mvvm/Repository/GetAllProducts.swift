//
//  GetAllProducts.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

final class GetAllProductsRepositoryImpl: GetAllProductsRepository {
    func fetch() async throws -> ProductResponse {
        let urlSession = URLSession.shared
        let url = URL(string: API.apiBaseUrl.appending("/products"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode(ProductResponse.self, from: data)
    }
}
