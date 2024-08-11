//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI

enum AlertStyle {
    case error
    case success
    case info
    
    var backgroundColor: Color {
        switch self {
        case .error:
             Color("Error", bundle: .module)
        case .success:
             Color("Success", bundle: .module)
        case .info:
             Color("Notification", bundle: .module)
        }
    }
    
    var icon: Image? {
        switch self {
        case .error:
             Image("Error", bundle: .module)
        case .success:
             Image("Success", bundle: .module)
        case .info:
             Image("Bell", bundle: .module)
        }
    }
    
    var title: String {
        switch self {
        case .error:
            "Error: "
        case .success:
            "Success: "
        case .info:
            "Notification: "
        }
    }
    
    var textColor: Color {
        switch self {
        case .error:
             Color("ErrorText", bundle: .module)
        case .success:
             Color("SuccessText", bundle: .module)
        case .info:
             Color("NotificationText", bundle: .module)
        }
    }
}
