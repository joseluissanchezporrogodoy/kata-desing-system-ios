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
            return Color("Error", bundle: .module)
        case .success:
            return Color("Success", bundle: .module)
        case .info:
            return Color("Notification", bundle: .module)
        }
    }
    
    var icon: Image? {
        switch self {
        case .error:
            return Image("Error", bundle: .module)
        case .success:
            return Image("Success", bundle: .module)
        case .info:
            return Image("Bell", bundle: .module)
        }
    }
}
