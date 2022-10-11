//
//  FlightEntity.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 10.10.2022.
//

import Foundation
struct FlightResponse: Codable {
    var data: [FlightData]?
}
struct FlightData : Codable{
    var flightDate: String?
    var departure : Departure?
    var arrival: Arrival?
    var airline: Airline?
    var flight: Flight?
    
    
}
struct Departure: Codable {
    
    var airport, timezone: String?
    var iata, icao: String?
    var terminal, gate, baggage: String?
    var delay: Int?
    var scheduled, estimated: String?
    var actual, estimatedRunway, actualRunway: String?
}


struct Arrival: Codable {
    var airport, timezone: String?
    var iata, icao: String?
    var terminal, gate, baggage: String?
    var delay: Int?
    var scheduled, estimated: String?
    var actual, estimatedRunway, actualRunway: String?
    
}

struct Airline: Codable {
    var name, iata, icao: String?
}

struct Flight: Codable {
    var number, iata, icao: String?
    
}

struct FlightCellViewModel { // Flight cell view model
    
    var airportName, departureAirport, arrivalAirport, flightDate,flightNumber, departureIata, arrivalIata, category: String?
    
}
