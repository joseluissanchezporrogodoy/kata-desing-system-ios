import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            DSButton(title: "Primary", state: .enabled, style: .primary, action: {
                showAlert = true
            })
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
