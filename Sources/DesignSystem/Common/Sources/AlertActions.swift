//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import Foundation

struct ActionInformation {
    let action: () -> Void
}

struct ODSAlertInformation {
    let first: ActionInformation?
    let second: ActionInformation?
    let dismissAction: (() -> Void)?
}
