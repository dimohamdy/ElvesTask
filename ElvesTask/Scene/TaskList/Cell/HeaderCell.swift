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
            guard let string = title ,let date = convertToString(date: string) else {
                return
            }
            dayNameLabel.text = getDayName(date: date)
            dateLabel.text = convertToString(date: date)

        }
        
    }
    
    
    func convertToString(date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: date) ?? nil
        
    }

    func convertToString(date:Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "E, d MMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    
    func getDayName(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
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
