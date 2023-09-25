//
//  Card.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation
import SwiftUI

struct Card: View {
    @State var product: ProductFromBackend
    @State var isActive = false
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        let formattedValue = formatter.string(from: NSNumber(value: product.price))
        
        return ("\(formattedValue ?? "")")
    }
    
    
    var body: some View {
            VStack() {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 145)
                        .clipShape(Rectangle())
                        .cornerRadius(5)
                } else {
                    Color(white: 0.9)
                        .frame(width: 160, height: 145)
                        .onAppear(perform: loadImage)
                        .cornerRadius(5)
                }
                Text(product.categoria)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .frame(width: 160, alignment: .leading)
                Text(product.nome)
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .frame(width: 160, height: 12, alignment: .leading)
                    .truncationMode(.tail)
                Text("R$ \(formattedPrice)")
                    .font(.system(size: 14))
                    .foregroundColor(Color.green)
                    .frame(width: 160, alignment: .leading)
            }
            .frame(maxWidth: 160)
            .background(Color.white)
            
        
    }
    
    private func loadImage() {
        guard let imageUrl = URL(string: product.images.principal) else {
            return
        }

        loadImageFromURL(url: imageUrl) { loadedImage in
            if let loadedImage = loadedImage {
                self.image = loadedImage
            } else {
                print("Could not load image from product \(product.id_product)")
                self.image = nil
            }
        }
    }
}
