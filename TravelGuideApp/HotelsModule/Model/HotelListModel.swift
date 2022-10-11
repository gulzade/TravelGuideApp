//
//  HotelListModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation
import Alamofire

protocol HotelListModelProtocol: AnyObject{
    func didDataFetchProcessFinishHotel(_ isSuccess: Bool)
}

class HotelListModel {
    weak var delegate: HotelListModelProtocol?   //Protocol delegate
    
  
    var hotelDataList : [Hotels] = []
 
    func fetchData(){ // Datalar çekeliyor
        guard let path = Bundle.main.path(forResource: "Hotels", ofType: "json") else {
          
                   print("\n-------> bundle path error")
                   return
               }
               let url = URL(fileURLWithPath: path)
               
               do {
                   let jsonData = try Data(contentsOf: url)
                   let hotelData = try JSONDecoder().decode(HotelsData.self, from: jsonData)
                 
                   self.hotelDataList = hotelData.result ?? []
                 
                   self.delegate?.didDataFetchProcessFinishHotel(true)
                 
               }
               catch {
                   self.delegate?.didDataFetchProcessFinishHotel(false)
                   print("\n====> error: \(error)" )
               }
               return
           }
     
}
