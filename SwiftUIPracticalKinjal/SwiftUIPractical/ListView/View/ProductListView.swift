//
//  ProductListView.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var viewModel = ProductListViewModel()
    @State var isLoading = false
    
    var body: some View {
        NavigationStack{
            
            List(viewModel.listRows, id: \.name) { detailProductView in
                NavigationLink(destination: DetailProductView(viewModel: detailProductView)) {
                    ProductRowView(viewModel: detailProductView)
                }
            }
                    .listStyle(PlainListStyle())
                    
                    .navigationTitle("ProductList")
        }.onAppear {
            viewModel.fetchListRows()
        }
        if isLoading {
            LoadingView()
        }
        
    }
    }


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
