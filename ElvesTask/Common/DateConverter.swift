//
//  DateConverter.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/19/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation
class DateConverter {
    static func convertToString(date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let reuslt = dateFormatter.date(from: date) ?? nil
        return reuslt
        
    }
    
    static func convertToString(date:Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "E, d MMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    
    static func getDayName(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
