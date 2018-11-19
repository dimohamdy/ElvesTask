//
//  HeaderCell.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/15/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell ,ReusableCellView {
    
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var title:String? = nil {
        didSet {
            guard let string = title ,let date = DateConverter.convertToString(date: string) else {
                return
            }
            dayNameLabel.text = DateConverter.getDayName(date: date)
            dateLabel.text = DateConverter.convertToString(date: date)

        }
        
    }
    
    

    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
