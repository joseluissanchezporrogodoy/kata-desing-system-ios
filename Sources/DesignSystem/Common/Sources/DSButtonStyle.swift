import SwiftUI
/// `DSButtonState` is an enum that represents the possible states of a button.
///
/// This enum defines two possible states for a button:
/// - `enabled`: The button is interactive and can be pressed.
/// - `disabled`: The button is not interactive and cannot be pressed.
public enum DSButtonState {
    case enabled
    case disabled
}

/// `DSButtonStyle` is an enum that represents the different visual styles of a button.
///
/// This enum defines three possible styles for a button:
/// - `primary`: The main style used for primary actions.
/// - `secondary`: A secondary style, typically used for less important actions.
/// - `alternative`: An alternative style, potentially used for special cases or alternative actions.
///
/// Each style provides custom properties for:
/// - `backgroundColor`: The background color associated with the button style.
/// - `borderColor`: The border color associated with the button style.
public enum DSButtonStyle {
    case primary
    case secondary
    case alternative
    var backgroundColor: Color {
        switch self {
        case .primary:
            Color("Primary", bundle: .module)
        case .secondary:
            Color.white
        case .alternative:
            Color("Alternative", bundle: .module)
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            Color.clear
        case .secondary:
            Color("Secondary", bundle: .module)
        case .alternative:
            Color.clear
        }
    }
}
