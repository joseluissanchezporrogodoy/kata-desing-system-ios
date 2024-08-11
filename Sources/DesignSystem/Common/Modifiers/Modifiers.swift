import SwiftUI

struct PTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .font(.custom("Roboto", size: 16))
                .fontWeight(.regular)
                .lineSpacing(4)
        } else {
            content
                .font(.custom("Roboto-Regular", size: 16)) 
                .padding(.vertical, 2)
        }
    }
}

extension Text {
    func pTextStyle() -> some View {
        self.modifier(PTextModifier())
    }
}

public struct DSAlertModifier: ViewModifier {
    @Binding var showAlert: Bool
    let dsAlertView: DSAlert
    
    public func body(content: Content) -> some View {
            ZStack {
                content
                
                if showAlert {
                    VStack {
                        Spacer()
                        dsAlertView
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut, value: showAlert)
                    }
                }
            }
        }
}


extension View {
    public func showDSAlert(showAlert: Binding<Bool>, alertView: DSAlert) -> some View {
        self.modifier(DSAlertModifier(showAlert: showAlert, dsAlertView: alertView))
    }
}
