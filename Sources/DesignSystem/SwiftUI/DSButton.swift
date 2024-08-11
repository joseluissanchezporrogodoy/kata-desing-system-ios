import SwiftUI

struct DSButton: View {
    let title: String
    let action: () -> Void
    var state: DSButtonState = .enabled
    var style: DSButtonStyle = .primary
    
    var body: some View {
        Button(action: {
            if state == .enabled {
                action()
            }
        }) {
            Text(title)
                .pTextStyle()
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundColor)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style.borderColor, lineWidth: 2)
                )
                .frame(width: 159,height: 48)
        }
        
        .disabled(state == .disabled)
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary:
            return state == .enabled ? .white : .white.opacity(0.5)
        case .secondary:
            return state == .enabled ? .black : .black.opacity(0.5)
        case .alternative:
            return state == .enabled ? .white : .white.opacity(0.5)
        }
    }
    
    private var backgroundColor: Color {
        return state == .enabled ? style.backgroundColor : style.backgroundColor.opacity(0.5)
    }
    
    private var borderColor: Color {
        return state == .enabled ? style.borderColor : style.borderColor.opacity(0.5)
    }
}

#Preview {
    VStack(spacing: 20) {
        DSButton(title: "Primary", action: {
            print("Primary Button Tapped")
        }, state: .enabled, style: .primary)
        
        DSButton(title: "Secondary", action: {
            print("Secondary Button Tapped")
        }, state: .disabled, style: .secondary)
        
        DSButton(title: "Alternative", action: {
            print("Alternative Button Tapped")
        }, state: .disabled, style: .alternative)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
