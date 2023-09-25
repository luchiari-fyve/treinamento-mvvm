//
//  PriceFormatter.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import Foundation

func formattedPrice(_ price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    
    let formattedValue = formatter.string(from: NSNumber(value: price))
    
    return formattedValue ?? ""
}
