//
//  Weather.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
// Name: Mohammed Suleiman Mohamed Al-Falahy ID: 121084174

import Foundation
struct Weather: Codable{
    //temp_c, feelslike_c, wind_kph, wind_dir, uv
    var city: String
    var tz_id: String
    var wind_kph: Double
    var wind_mph: Double
    var feelslike_c: Double
    var wind_dir: String
    var uv: Double
    var temp_c: Double
    var temp_f : Double
    
    
    func encode(to encoder: Encoder) throws {
        //nothing to write to the API
    }
    
    //Decode the returned JSON from the API
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        //for the Location Object
        let locationContainer = try response.decodeIfPresent(Location.self, forKey: .location)
        self.city = locationContainer?.name ?? "Not Available"
        self.tz_id = locationContainer?.tz_id  ?? "Not Available"
        
        self.wind_kph = try response.decodeIfPresent(Double.self, forKey: .wind_kph) ?? 0.0
        self.wind_mph = try response.decodeIfPresent(Double.self, forKey: .wind_mph) ?? 0.0
        self.feelslike_c = try response.decodeIfPresent(Double.self, forKey: .feelslike_c) ?? 0.0
        self.wind_dir = try response.decodeIfPresent(String.self, forKey: .wind_dir) ?? "Not Available"
        self.uv = try response.decodeIfPresent(Double.self, forKey: .uv) ?? 0.0
        
        //from the Current object
        let currentContainer = try response.decodeIfPresent(Current.self, forKey: .current)
        self.temp_c = currentContainer?.temp_c ?? 0.0
        self.temp_f = currentContainer?.temp_f ?? 0.0
        
    }
    
    //for the JSON from the API
    //maps properties of class with JSON object from API
    enum CodingKeys : String, CodingKey{
        case city = "name"
        case tz_id = "tz_id"
        case wind_kph = "wind_kph"
        case wind_mph = "wind_mph"
        case feelslike_c = "feelslike_c"
        case wind_dir = "wind_dir"
        case uv = "uv"
        case temp_c = "temp_c"
        case temp_f = "temp_f"
        case current = "current"
        case location = "location"
    }
    
    init(){
        self.city = ""
        self.tz_id = ""
        self.wind_kph = 0.0
        self.wind_mph = 0.0
        self.feelslike_c = 0.0
        self.wind_dir = ""
        self.uv = 0.0
        self.temp_c = 0.0
        self.temp_f = 0.0
    }
}

struct Current: Codable{
    var temp_c: Double
    var temp_f : Double
    
    enum CodingKeys : String, CodingKey{
        case temp_c = "temp_c"
        case temp_f = "temp_f"
    }
    
    func encode(to encoder: Encoder) throws {
        //Nothing
    }
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp_c = try response.decodeIfPresent(Double.self, forKey: .temp_c) ?? 0.0
        self.temp_f = try response.decodeIfPresent(Double.self, forKey: .temp_f) ?? 0.0
    }
}

struct Location: Codable{
    var name: String
    var tz_id : String
    
    func encode(to encoder: Encoder) throws {
        //nothing
    }
    
    init(from decoder: Decoder) throws {
        let response =  try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "Not Available"
        self.tz_id = try response.decodeIfPresent(String.self, forKey: .tz_id) ?? "Not Available"
    }
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case tz_id = "tz_id"
    }
}
