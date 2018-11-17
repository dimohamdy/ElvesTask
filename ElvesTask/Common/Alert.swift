//
//  Alert.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/15/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
