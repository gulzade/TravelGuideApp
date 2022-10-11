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
                   print(hotelData)
                   self.hotelDataList = hotelData.result ?? []
                 //  print(self.hotelDataList)
                   self.delegate?.didDataFetchProcessFinishHotel(true)
                 
               }
               catch {
                   self.delegate?.didDataFetchProcessFinishHotel(false)
                   print("\n====> error: \(error)" )
               }
               return
           }
       /* AF.request("http://api.aviationstack.com/v1/flights?access_key=1fe41b8510e941a9e59d8ff5dc3dc2b2",method: .get).response{ [self] response in
            if let data = response.data {
                do {
                    let hotelData  = try JSONDecoder().decode(HotelsData.self, from: data)
                    
                  //  print(flightData)
                    self.hotelDataList = hotelData.result  ?? []
                  //  print(flightData.data?.first?.flightDate)
                  //  self.flightResponse = [Hotels]
                  print(self.flightDataList)
                    self.delegate?.didDataFetchProcessFinish(true)
                    
                  /*  for i in flightData.data!
                        print(i)
                    }*/
                    
                } catch  {
                    self.delegate?.didDataFetchProcessFinish(false)
                    print(error.localizedDescription)
                    print("JSON Serilization error")
                }
            }
        }
    }*/
        
}
