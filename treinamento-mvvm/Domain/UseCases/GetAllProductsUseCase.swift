//
//  GetAllProductsUseCase.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

protocol GetAllProductsUseCase {
    func getAllProducts() async throws -> ProductResponse
}
