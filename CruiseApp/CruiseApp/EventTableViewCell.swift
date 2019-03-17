//
//  EventTableViewCell.swift
//  CruiseApp
//
//  Created by Noah Gerberick on 3/16/19.
//  Copyright © 2019 Noah Gerberick. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var joinLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func joinPressed(_ sender: Any) {
        print((sender as! UIButton).tag)
        joinLabel.setTitle("Joined", for: UIControl.State.normal)
    }
}
