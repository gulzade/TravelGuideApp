//
//  HotelEntity.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation

struct HotelsData: Codable {
    let result: [Hotels]?
}


struct Hotels: Codable {
    
    let hotel_id, hotelName, hotelCountry, hotelCity: String?
    let hotelImageUrl: String?
    let category, hotelDescription: String?

}
struct HotelCellViewModel { // Hotel cell view model
    
    var hotelId : String?
    var hotelName: String?
    var hotelCountry: String?
    var hotelCity:String?
    var hotelImageURL: String?
    var category: String?
    var hotelDescription: String?
    
}
