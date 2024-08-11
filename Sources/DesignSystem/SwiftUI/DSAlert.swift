//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI


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
