import SwiftUI

public enum DSButtonState {
    case enabled
    case disabled
}

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
