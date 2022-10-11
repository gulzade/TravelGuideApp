//
//  HotelListViewModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation

protocol HotelListViewModelProtocol: AnyObject{ //Viewın protokolü
    func didCellItemFetch(_ items: [HotelCellViewModel]) //view'a haber vermek için

    
}

class HotelListViewModel {
    // View'a haber vermek için view'ın instance'ına ihtiyaç var. Bunu burada delegate ile yapıyoruz.
    
    private let modelHotel = HotelListModel() //ViewModel modelı kendi içinte tutmak zorunda. Modelın intance'ına sahip olacak
    
    weak var viewDelegate: HotelListViewModelProtocol? // delegate işlemleri çekmek için
    
   
    init() {
        modelHotel.delegate = self // modeldan haber almaya başlamak için
    }
    
    func didViewLoad(){
        modelHotel.fetchData() //  viewcontroller didload oldugunda yani ekranda gözüktüğünde viewModela haber verecek, viewModelda gitcek dataları çekecek
        
    }
    
    func didClickItem(at index: Int){ // basılan index
        let selectedItem = modelHotel.hotelDataList[index]
    }
   
}

private extension HotelListViewModel {
 
    @discardableResult
    func makeViewBasedModel(_ hotels: [Hotels]) -> [HotelCellViewModel] { //gelen dataya göre viewbase model yapacak
        return hotels.map {.init(hotelId: $0.hotel_id ?? "" , hotelName: $0.hotelName!, hotelCountry: $0.hotelCountry!, hotelCity: $0.hotelCity!, hotelImageURL: $0.hotelImageUrl!, category: $0.category!, hotelDescription: $0.hotelDescription!)}
    }
}

// MARK: - HotelListModelProtocol
extension HotelListViewModel: HotelListModelProtocol {
    func didDataFetchProcessFinishHotel(_ isSuccess: Bool) {
        if isSuccess {
            let hotels = modelHotel.hotelDataList
            let cellModels = makeViewBasedModel(hotels)
            viewDelegate?.didCellItemFetch(cellModels)
            
        } else{
            
        }
    }
}
