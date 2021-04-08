//
//  TableViewCell.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
// NAME: MOHAMMED SULEIMAN MOHAMED AL-FALAHY ID: 121083174

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var city : UILabel!
    @IBOutlet var tz_id : UILabel!
    @IBOutlet var windkph : UILabel!
    @IBOutlet var windmph : UILabel!
    @IBOutlet var feelslike : UILabel!
    @IBOutlet var windir : UILabel!
    @IBOutlet var uv : UILabel!
    @IBOutlet var tempc : UILabel!
    @IBOutlet var tempd : UILabel!
    @IBOutlet var imageCell : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let bgUIImage : UIImage = UIImage(named: "cloud")!
        self.imageCell.image = bgUIImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
