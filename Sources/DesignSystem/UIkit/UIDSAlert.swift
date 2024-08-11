import UIKit

public class UIDSAlert: UIView {
    
    // MARK: - Propiedades
    private let title: String
    private let style: AlertStyle
    private let showIcon: Bool
    private let alertInfo: ODSAlertInformation
    
    private let iconImageView: UIImageView = UIImageView()
    private let messageLabel: UILabel = UILabel()
    private let dismissButton: UIButton = UIButton(type: .custom)
    
    private static var hideAlertTask: DispatchWorkItem?
    
    // MARK: - Inicialization
    public init(title: String, style: AlertStyle, showIcon: Bool, alertInfo: ODSAlertInformation) {
        self.title = title
        self.style = style
        self.showIcon = showIcon
        self.alertInfo = alertInfo
        super.init(frame: .zero)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Config
    private func setupView() {
        backgroundColor = style.backgroundColorUK
        
        if showIcon, let icon = style.icon {
            iconImageView.image = icon
            iconImageView.tintColor = style.backgroundColorUK
            addSubview(iconImageView)
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 24),
                iconImageView.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
        
        dismissButton.setImage(UIImage(named: "Cross", in: .module, with: nil), for: .normal)
        addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            dismissButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 24),
            dismissButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        messageLabel.text = style.title + title
        messageLabel.textColor = style.textColorUK
        messageLabel.numberOfLines = 0
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let messageLabelLeadingAnchor = showIcon ?
        messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 24) :
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        
        NSLayoutConstraint.activate([
            messageLabelLeadingAnchor,
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor, constant: -12)
        ])
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    // MARK: - Configuración de acciones
    private func setupActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        addGestureRecognizer(longPressGesture)
        
        dismissButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    @objc private func handleTap() {
        alertInfo.first?.action()
    }
    
    @objc private func handleLongPress() {
        alertInfo.second?.action()
    }
    
    @objc private func handleDismiss() {
        alertInfo.dismissAction?()
        removeFromSuperview()
    }
}

public extension UIDSAlert {
    static func show(title: String, style: AlertStyle, alertInfo: ODSAlertInformation, controller: UIViewController) {
    
        let alert = UIDSAlert(
            title: "This is an alert!",
            style: .error,
            showIcon: true,
            alertInfo: alertInfo
        )
        
        controller.view.addSubview(alert)
        
        alert.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            alert.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            alert.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16),
            alert.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16),
            alert.heightAnchor.constraint(greaterThanOrEqualToConstant: 48),
            alert.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
