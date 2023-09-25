//
//  ProductListViewModel.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [ProductFromBackend] = []
    private let useCase: GetAllProductsUseCase
    
    init(useCase: GetAllProductsUseCase) {
        self.useCase = useCase
    }
    
    func attachProductsToList() async {
        do {
            self.products = try await useCase.getAllProducts().products
        }
        catch {
            print(error)
        }
    }
}
