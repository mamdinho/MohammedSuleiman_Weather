//
//  TableViewCell.swift
//  MohammedSuleiman_Weather
//
//  Created by Mohammed on 2021-03-31.
//

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
