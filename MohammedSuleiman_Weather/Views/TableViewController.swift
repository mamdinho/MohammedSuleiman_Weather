//
//  TableViewController.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
// NAME: MOHAMMED SULEIMAN MOHAMED AL-FALAHY ID: 121083174

import UIKit
import Combine

class TableViewController: UITableViewController {

    var prt1 = "https://api.weatherapi.com/v1/current.json?key=5bc90109297e4fdd95a171454213103&q="
    var prt2 = "&aqi=no"
    
    var cityChosen = ""
    private let weatherFetcher = WeatherFetcher.getInstance()
    private var Currentweather = Weather()
    private var cancellables: Set<AnyCancellable> = []
    
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 750
        self.url = "\(prt1)\(cityChosen)\(prt2)"
        
        print("URL: \(self.url)")
        self.weatherFetcher.fetchDataFromAPI(url: url)
        self.receiveChanges() //listen for changes
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.city.text = self.cityChosen
        cell.tz_id.text = self.Currentweather.tz_id
        cell.windkph.text = "\(self.Currentweather.wind_kph)"
        cell.windmph.text = "\(self.Currentweather.wind_mph)"
        cell.feelslike.text = "\(self.Currentweather.feelslike_c)"
        cell.windir.text = self.Currentweather.wind_dir
        cell.uv.text = "\(self.Currentweather.uv)"
        cell.tempc.text = "\(self.Currentweather.temp_c)"
        cell.tempd.text = "\(self.Currentweather.temp_f)"
        return cell
    }

    private func receiveChanges(){
        self.weatherFetcher.$weather.receive(on: RunLoop.main)
            .sink{ (wthr) in
                print(#function, "Received weather : ", wthr)
                self.Currentweather = wthr
                self.tableView.reloadData()
            }
            .store(in : &cancellables)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
