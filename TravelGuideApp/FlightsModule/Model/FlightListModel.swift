//
//  FlightListModel.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import Foundation

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
        
        AF.request("http://api.aviationstack.com/v1/flights?access_key=c160a1acb6b8b5afa7f6b763acce01c6",method: .get).response{ [self] response in
            if let data = response.data {
                do {
                    let flightData  = try JSONDecoder().decode(FlightResponse.self, from: data)
                    
                 //   print(flightData)
                    self.flightDataList = flightData.data ?? []
                  //  print(flightData.data?.first?.flightDate)
                   //  self.flightResponse = [flightData]
                   // print(self.flightDataList)
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
    }
        
    
}
