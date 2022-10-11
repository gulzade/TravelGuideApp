//
//  FlightListModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import Foundation
import Alamofire

protocol FlightListModelProtocol: AnyObject{
    func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class FlightListModel {
    weak var delegate: FlightListModelProtocol?   //Protocol delegate
    
   // var flightDatas:Decodable?
  //  var flightResponse : [FlightResponse] = []
    var flightDataList : [FlightData] = []
  //  var flights: [Flight] = []
    func fetchData(){ // Datalar çekeliyor
        guard let path = Bundle.main.path(forResource: "Flight", ofType: "json") else {
          
                   print("\n-------> bundle path error")
                   return
               }
               let url = URL(fileURLWithPath: path)
               
               do {
                   let jsonData = try Data(contentsOf: url)
                   let flightdata = try JSONDecoder().decode(FlightResponse.self, from: jsonData)
                   self.flightDataList = flightdata.data ?? []
                   self.delegate?.didDataFetchProcessFinish(true)
                
               }
               catch {
                   self.delegate?.didDataFetchProcessFinish(false)
                   print("\n====> error: \(error)" )
               }
               return
           }
       /* AF.request("http://api.aviationstack.com/v1/flights?access_key=1fe41b8510e941a9e59d8ff5dc3dc2b2",method: .get).response{ [self] response in
            if let data = response.data {
                do {
                    let flightData  = try JSONDecoder().decode(FlightResponse.self, from: data)
                    
                  //  print(flightData)
                    self.flightDataList = flightData.data ?? []
                  //  print(flightData.data?.first?.flightDate)
                  //  self.flightResponse = [flightData]
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
