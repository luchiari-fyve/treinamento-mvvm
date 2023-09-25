//
//  GetAllProductsRepository.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation


protocol GetAllProductsRepository {
    func fetch() async throws -> ProductResponse
}
