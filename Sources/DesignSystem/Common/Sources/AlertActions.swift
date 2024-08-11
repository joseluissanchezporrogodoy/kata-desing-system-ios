//
//  File.swift
//
//
//  Created by JLSANCHEZP on 11/8/24.
//

import Foundation

public struct ActionInformation {
    public let action: () -> Void
    public init(action: @escaping () -> Void) {
        self.action = action
    }
}

public struct ODSAlertInformation {
    public let first: ActionInformation?
    public let second: ActionInformation?
    public let dismissAction: (() -> Void)?
    public init(first: ActionInformation?, second: ActionInformation?, dismissAction: (() -> Void)?) {
        self.first = first
        self.second = second
        self.dismissAction = dismissAction
    }
}
