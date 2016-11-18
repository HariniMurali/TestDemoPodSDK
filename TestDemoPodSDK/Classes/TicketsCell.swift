//
//  TicketsCell.swift
//  HelpSumoSDK
//
//  Created by APP DEVELOPEMENT on 16/11/16.
//  Copyright © 2016 APP DEVELOPEMENT. All rights reserved.
//

import UIKit

class TicketsCell: UITableViewCell {

    @IBOutlet weak var statusIndicator: UIView!
    
    @IBOutlet weak var labelStatus: UILabel!
    
    @IBOutlet weak var labelRequester: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
