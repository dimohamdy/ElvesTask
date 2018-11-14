//
//  ReusableCellView.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/15/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

protocol ReusableCellView: class {
    static var id: String {get}
}

extension ReusableCellView {
    static var id: String {
        return "\(self)"
    }
}
