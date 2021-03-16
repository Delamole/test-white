//
//  WeatherTableViewCell.swift
//  test_white
//
//  Created by Владислав Бочаров on 15.03.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var paramLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initCell(item: Data)  {
        paramLabel.text = item.name
        valueLabel.text = item.value
    }
}
