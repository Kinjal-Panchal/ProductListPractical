//
//  ListViewModel.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import Foundation

protocol ProductListViewModelProtocol {
    var listRows: [DetailProductViewModel] { get }
    func fetchListRows()
}

class ProductListViewModel: ProductListViewModelProtocol, ObservableObject {
    
    @Published private var isLoading = false
    @Published var listRows = [DetailProductViewModel]()

     func fetchListRows() {
         isLoading = true
         NetworkManager.shared.getProducts { [weak self] result in
            self?.isLoading = false
            guard let data = result?.products else {
                return
            }
            data.forEach { [weak self] product in
                let detailViewModel = DetailProductViewModel(product: product)
                    self?.listRows.append(detailViewModel)
            }
           
        }
    }
}
