//
//  LaunchesFetcher.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
// NAME: MOHAMMED SULEIMAN MOHAMED AL-FALAHY ID: 121083174

import Foundation

class WeatherFetcher : ObservableObject{
    //singleton Instance
    private static var shared: WeatherFetcher?
    
    var API_KEY = "5bc90109297e4fdd95a171454213103"
    
    //Observed property
    @Published var weather = Weather()
    
    static func getInstance() -> WeatherFetcher{
        if shared != nil{
            return self.shared!
        }else{
            return WeatherFetcher()
        }
    }
    
    
    func fetchDataFromAPI(url : String){
        guard let api = URL(string: url) else{
            return
        }
        
        //URLSession is a sinleton class
        //returns the URL session (a thread that will perofom all communications over the network)
        //response is additional HTTP info
        URLSession.shared.dataTask(with: api){ (data: Data?, response: URLResponse?, error: Error?) in
            if let err = error{
                print(#function, "Couldn't fetch data", err)
            }else{
                //we have the data fetched from the URL
                //run asynchronously
                DispatchQueue.global().async {
                    do{
                        if let jsonData = data{
                            let decoder = JSONDecoder()
                            //if response is array use [Launch] else don't use
                            let decodedList = try decoder.decode(Weather.self, from: jsonData)
                            
                            //run this in the main thread
                            //UI can only be updated in main thread
                            DispatchQueue.main.async {
                                //assign to the observable
                                self.weather = decodedList
                            }
                        }else{
                            print(#function, "No JSON data has been received")
                        }
                    }catch let error{
                        print(#function, error)
                    }
                }
            }
        }.resume()
    }
}
