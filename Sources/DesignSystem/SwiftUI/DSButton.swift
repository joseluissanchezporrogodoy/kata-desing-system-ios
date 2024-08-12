import SwiftUI
/// A custom button view with configurable title, state, style, and action.
///
/// The `DSButton` struct is a SwiftUI view that presents a button with a title, customizable
/// state (enabled or disabled), and style (primary, secondary, or alternative). The button
/// can perform an action when tapped, provided it is in the enabled state.
///
/// - Parameters:
///   - title: The text to be displayed on the button.
///   - state: The state of the button, determining whether it is interactive (`enabled`) or not (`disabled`).
///   - style: The visual style of the button, which defines the background color, border color, and text color.
///   - action: A closure to be executed when the button is tapped, if the button is enabled.
///
/// - Returns: A view that displays a button with the specified properties and behavior.
///
/// - Example:
/// ```swift
/// DSButton(
///     title: "Submit",
///     state: .enabled,
///     style: .primary,
///     action: {
///         print("Button tapped")
///     }
/// )
/// ```
/// This example demonstrates how to create a `DSButton` with a title "Submit", in an enabled state, using the primary style, and printing a message when the button is tapped.
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
