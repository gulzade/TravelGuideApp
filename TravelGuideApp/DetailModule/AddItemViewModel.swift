//
//  AddItemViewModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation
protocol AddNewItemViewModelProtocol: AnyObject {
    func didItemAdd(_ isSuccess: Bool)
}

class AddNewItemViewModel {
    private let model = AddNewItemModel()
    weak var viewDelegate: AddNewItemViewModelProtocol?
    
    init() {
        model.delegate = self
    }
    // yeni item ekleme
    func didSaveButtonPressed(name: String, details: String) {
        model.addItem(name: name, details: details)
    }
}

// işlem sonu, ana ekranı haberdar etmek için
extension AddNewItemViewModel: AddNewItemModelProtocol {
    func didDataAddProcessFinish(_ isSuccess: Bool) {
        viewDelegate?.didItemAdd(true)
    }
}
