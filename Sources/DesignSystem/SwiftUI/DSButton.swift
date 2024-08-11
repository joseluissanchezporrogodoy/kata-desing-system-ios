import SwiftUI

public struct DSButton: View {
    
    let title: String
    var state: DSButtonState = .enabled
    var style: DSButtonStyle = .primary
    let action: () -> Void
    
    public init(title: String, state: DSButtonState = .enabled, style: DSButtonStyle = .primary, action: @escaping () -> Void) {
        self.title = title
        self.state = state
        self.style = style
        self.action = action
    }
    
    public var body: some View {
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
        DSButton(title: "Primary", state: .enabled, style: .primary, action: {
            print("Primary Button Tapped")
        })
        
        DSButton(title: "Secondary", state: .disabled, style: .secondary, action: {
            print("Secondary Button Tapped")
        })
        
        DSButton(title: "Alternative", state: .disabled, style: .alternative, action: {
            print("Alternative Button Tapped")
        })
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
