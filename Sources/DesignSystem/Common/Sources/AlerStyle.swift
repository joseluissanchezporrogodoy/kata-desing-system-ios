//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI
/// An enumeration that defines different styles of alerts.
///
/// The `AlertStyle` enum represents various alert types with associated properties such as background color, icon, title, and text color. Each case provides a specific visual appearance for an alert.
///
/// - Cases:
///   - error: Represents an error alert style with an associated error icon, red background, and error title.
///   - success: Represents a success alert style with an associated success icon, green background, and success title.
///   - info: Represents an informational alert style with an associated bell icon, blue background, and informational title.
///
/// - Properties:
///   - backgroundColor: The background color associated with the alert style.
///   - icon: The icon image associated with the alert style. This may return `nil` if no icon is specified for a particular style.
///   - title: The title text associated with the alert style, which is prepended to the alert message.
///   - textColor: The text color used for the alert message and title.
///
/// - Example:
/// ```swift
/// let alertStyle = AlertStyle.error
/// let backgroundColor = alertStyle.backgroundColor // Retrieves the background color for the error style.
/// let icon = alertStyle.icon // Retrieves the icon for the error style.
/// let title = alertStyle.title // Retrieves the title for the error style.
/// let textColor = alertStyle.textColor // Retrieves the text color for the error style.
/// ```
/// This example shows how to access the properties of the `AlertStyle` enum for an error alert.
public enum AlertStyle {
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
extension AlertStyle {
    var iconAccessibilityLabel: String {
        switch self {
        case .error:
            return "Error Icon"
        case .success:
            return "Success Icon"
        case .info:
            return "Notification Icon"
        }
    }
}
