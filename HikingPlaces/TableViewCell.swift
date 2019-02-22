//
//  TableViewCell.swift
//  HikingPlaces
//
//  Created by jear on 2018-11-03.
//  Copyright © 2018 jear. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgplaceholder: UIImageView!
    
    @IBOutlet weak var labelplaceholder: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
