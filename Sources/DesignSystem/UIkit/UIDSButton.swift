import SwiftUI
import UIKit

public class UIDSButton: UIView {
    
    var message: String
    var state: DSButtonState = .enabled
    var style: DSButtonStyle
    var action: () -> Void
    
    private var hostingController: UIHostingController<DSButton>?
    
    public init(frame: CGRect, message: String, style: DSButtonStyle, action: @escaping () -> Void) {
        self.message = message
        self.style = style
        self.action = action
        super.init(frame: frame)
        setupHostingController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHostingController() {
        let dSButtonView = DSButton(title: message,state: state, style: style, action: action)
        let hostingController = UIHostingController(rootView: dSButtonView)
        self.hostingController = hostingController
        
        addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: self.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
