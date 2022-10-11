//
//  HotelEntity.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation

struct Hotels: Codable {
    let result: [Result]?
}


struct Result: Codable {
    
    let hotelID, hotelName, hotelCountry, hotelCity: String?
    let hotelImageURL: String?
    let category, hotelDescription: String?

}
