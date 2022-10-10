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
   // var flightStatus: String?
    var departure : Departure?
    var arrival: Arrival?
    var airline: Airline?
    var flight: Flight?
//    var aircraft: Aircraft?


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
struct Aircraft: Codable {
    var registration, iata, icao, icao24: String?
}

struct FlightCellViewModel { // Flight cellinin viewının modeli

   
    var airportName, departureAirport, arrivalAirport, flightDate,flightNumber, departureIata, arrivalIata, category: String?
   // let gate: Gate?
   // let departDate, returnDate: String?
  //  let duration, distance: Int?

}
