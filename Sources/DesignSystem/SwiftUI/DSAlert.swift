//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI

/// A custom view that displays an alert with a message, icon, and customizable style.
///
/// The `DSAlertView` struct is a SwiftUI view that presents an alert with a message,
/// optional icon, and customizable visual style. The alert also includes actions for
/// tapping, long-pressing, and dismissing the view.
///
/// - Parameters:
///   - message: The text message to be displayed in the alert.
///   - style: The visual style of the alert, defining the title, icon, text color, and background color.
///   - showIcon: A Boolean value indicating whether to show an icon in the alert.
///   - alertInfo: An `ODSAlertInformation` object that contains actions for different gestures and dismissing the alert.
///
/// - Returns: A view that displays an alert with the specified properties.
///
/// - Example:
/// ```swift
/// DSAlertView(
///     message: "This is an alert!",
///     style: .error,
///     showIcon: true,
///     alertInfo: ODSAlertInformation(
///         first: ActionInformation(action: {
///             print("First action triggered")
///         }),
///         second: ActionInformation(action: {
///             print("Second action triggered")
///         }),
///         dismissAction: {
///             print("Dismiss action triggered")
///         }
///     )
/// )
/// ```
/// This example demonstrates how to create a `DSAlertView` with a warning style, an icon, and actions for tap, long press, and dismissal.
struct DSAlertView: View {
    let message: String
    let style: AlertStyle
    let showIcon: Bool
    let alertInfo: ODSAlertInformation
    
    var body: some View {
        HStack {
            HStack {
                if showIcon, let icon = style.icon {
                    icon
                        .foregroundColor(style.backgroundColor)
                        .padding(12)
                }
                Text(style.title + message)
                    .foregroundColor(style.textColor)
                    .pTextStyle()
                Spacer()
                Button(action: {
                    alertInfo.dismissAction?()
                }) {
                    Image("Cross", bundle: .module)
                        .padding(.trailing,12)
                }
            }
            .padding(.horizontal,12)
        }
        .background(style.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        .padding(12)
        .onTapGesture {
            alertInfo.first?.action()
        }
        .onLongPressGesture {
            alertInfo.second?.action()
        }
    }
}

struct DSAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DSAlertView(
            message: "Error Message",
            style: .success,
            showIcon: true,
            alertInfo: ODSAlertInformation(
                first: ActionInformation(action: {
                    print("Button 1 Action triggered")
                }),
                second: nil,
                dismissAction: {
                    print("Dismiss action triggered")
                }
            )
        )
        .previewLayout(.sizeThatFits)
    }
}
