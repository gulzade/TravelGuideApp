//
//  FlightListViewModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import Foundation


protocol FlightListViewModelProtocol: AnyObject{ //Viewın protokolü
    func didCellItemFetch(_ items: [FlightCellViewModel]) //view'a haber vermek için

    
}
class FlightListViewModel {
    // View'a haber vermek için view'ın instance'ına ihtiyaç var. Bunu burada delegate ile yapıyoruz.
    
    private let model = FlightListModel() //ViewModel modelı kendi içinte tutmak zorunda. Modelın intance'ına sahip olacak
    
    weak var viewDelegate: FlightListViewModelProtocol? // delegate işlemleri çekmek için
    
   
    init() {
        model.delegate = self // modeldan haber almaya başlamak için
    }
    func didViewLoad(){
       model.fetchData() //  viewcontroller didload oldugunda yani ekranda gözüktüğünde viewModela haber verecek, viewModelda gitcek dataları çekecek
        
    }
    
    func didClickItem(at index: Int){ // basılan index
        let selectedItem = model.flightDataList[index]
    }
   
}

private extension FlightListViewModel {
 
    @discardableResult
    func makeViewBasedModel(_ posts: [FlightData]) -> [FlightCellViewModel] { //gelen dataya göre viewbase model yapacak
        return posts.map {.init(airportName: $0.airline?.name ?? "not found!", departureIata: $0.departure?.airport ?? "not found!" , arrivalIata: $0.arrival?.airport ?? "not found!", flightDate: convertDateFormat(inputDate: $0.departure?.scheduled! ?? "" ), flightNumber: $0.flight?.number ?? "not found!")}
    }
}

// MARK: - PostListModelProtocol
extension FlightListViewModel: FlightListModelProtocol {
   
    func didDataFetchProcessFinish(_ isSuccess: Bool) {  /*Api'den gelen data burada. ViewModel, Modeldan gelen datayı transform edicek */
        
        if isSuccess {
            let flights = model.flightDataList
            let cellModels = makeViewBasedModel(flights)
            viewDelegate?.didCellItemFetch(cellModels)
            
        } else{
            
        }
       
       
    }
}
extension FlightListViewModel {
    func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
        olDateFormatter.locale = Locale(identifier: "en_US_POSIX")
         olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

         let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "dd/MMM/yyyy h:mm a"

         return convertDateFormatter.string(from: oldDate!)
    }

}
