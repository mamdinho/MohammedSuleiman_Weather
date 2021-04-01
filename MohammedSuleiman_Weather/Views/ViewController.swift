//
//  ViewController.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
//

import UIKit
 
class ViewController: UIViewController {

    @IBOutlet var pickerView : UIPickerView?
    let cities = ["Toronto", "London", "New York", "Moscow", "Beijing", "Mumbai", "Cairo", "Dhaka", "Mumbai", "Karachi"]
    var cityPicked = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "WEATHER APPLICATION"
        cityPicked = cities[0] //initially
        self.pickerView?.delegate = self
        self.pickerView?.dataSource = self
    }

    @IBAction func getWeatherInfo(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let tbvc = storyboard.instantiateViewController(withIdentifier: "weatherVC") as! TableViewController
        
        tbvc.cityChosen = self.cityPicked
        self.navigationController?.pushViewController(tbvc, animated: true)
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cityPicked = self.cities[row]
        print(#function, "City selected: \(self.cities[row])")
    }
}

