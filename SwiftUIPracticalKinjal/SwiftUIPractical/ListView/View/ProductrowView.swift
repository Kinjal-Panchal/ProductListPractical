//
//  ProductrowView.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 11/02/23.
//

import SwiftUI

struct ProductRowView: View {
    
    let viewModel: DetailProductViewModel

    var body: some View {
        HStack(spacing: 20) {
            ImageProductView(imageData: viewModel.imageData,
                             imageSize: CGSize(width: 100, height: 80),
                             radius: 0).overlay{
                VStack {
                    FavoriteButton(isFavorite: viewModel.isFavorite) {
                        viewModel.didTapFavoriteButton()
                    }.padding(.top, 50).padding(.leading, 80)
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.name).font(.system(size: 12, weight: .bold))
                Text(viewModel.price).font(.system(size: 10, weight: .bold))
            }
            
            
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: DetailProductViewModel(product: Product.getProduct()))
    }
}
