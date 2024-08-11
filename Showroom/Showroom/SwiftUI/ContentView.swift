//
//  ContentView.swift
//  Showroom-SwiftUI
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI
import DesignSystem
// Usage example
struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert = true
            }
        }
        .showDSAlert(showAlert: $showAlert, alertView: DSAlert(
            message: "Success Message",
            style: .success,
            showIcon: true,
            alertInfo: ODSAlertInformation(
                first: ActionInformation(action: {
                    print("Button 1 Action triggered")
                }),
                second: nil,
                dismissAction: {
                    print("Dismiss action triggered")
                    showAlert = false
                }
            )
        ))
    }
}

#Preview {
    ContentView()
}
