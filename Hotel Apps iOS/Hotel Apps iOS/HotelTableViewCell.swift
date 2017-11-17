//
//  HotelTableViewCell.swift
//  Hotel Apps iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var lblrate: UILabel!
    @IBOutlet weak var lblalamat: UILabel!
    @IBOutlet weak var lblHotel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
