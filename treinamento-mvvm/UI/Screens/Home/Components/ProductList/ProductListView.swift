//
//  ProductList.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation
import SwiftUI

struct ProductList: View {
    @StateObject private var viewModel = ProductListViewModel(
        useCase: GetAllProductsImpl(repository: GetAllProductsRepositoryImpl()))
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        HStack {
            HStack {
                Text("Todos os produtos")
                    .font(.system(size: 16))
                Text("(3 produtos)")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Text("Visualizar todos")
                .font(.system(size: 12))
                .foregroundColor(Color.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.top, 8)
        
        if viewModel.products.isEmpty {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(0..<3, id: \.self) {_ in
                    VStack() {
                        CardSkeleton()
                            .frame(maxWidth: .infinity)
                    }.frame(height: 220)
                }
            }
            .task {
                await viewModel.attachProductsToList()
            }
        } else {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.products, id: \.id_product) { product in
                            Card(product: product)
                    }
                }
            }
        }
    }
}
