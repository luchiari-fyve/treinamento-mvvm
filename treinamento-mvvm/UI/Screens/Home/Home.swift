//
//  Home.swift
//  treinamento-mvvm
//
//  Created by Laura Ranucci Luchiari on 25/09/23.
//

import SwiftUI

struct Home: View {
    @State var search = ""
   
    var body: some View {
        VStack {
            Header(searchText: $search)
            ProductList()
            Footer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
