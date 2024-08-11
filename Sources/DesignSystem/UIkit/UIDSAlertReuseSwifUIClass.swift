//
//  UIDSAlertReuseSwifUIClass.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI
import UIKit

public class UIDSAlertReuseSwifUIClass: UIView {
    
    // Propiedades configurables para la alerta
    var message: String
    var style: AlertStyle
    var showIcon: Bool
    var alertInfo: ODSAlertInformation
    
    
    private var hostingController: UIHostingController<DSAlert>?
    
    
    init(frame: CGRect, message: String, style: AlertStyle, showIcon: Bool, alertInfo: ODSAlertInformation) {
        self.message = message
        self.style = style
        self.showIcon = showIcon
        self.alertInfo = alertInfo
        super.init(frame: frame)
        
        setupHostingController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configuración del HostingController
    private func setupHostingController() {
        let alertView = DSAlert(
            message: message,
            style: style,
            showIcon: showIcon,
            alertInfo: alertInfo
        )
        
        let hostingController = UIHostingController(rootView: alertView)
        self.hostingController = hostingController
        
        // Añadir la vista del hosting controller a la vista principal
        addSubview(hostingController.view)
        
        // Configurar las restricciones para que la vista ocupe todo el espacio
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: self.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

public extension UIDSAlertReuseSwifUIClass {
    static func show(title: String, style: AlertStyle, alertInfo: ODSAlertInformation, controller: UIViewController) {
        // Crear una instancia de UIDSAlert
        let dsAlertView = UIDSAlertReuseSwifUIClass(
            frame: CGRect(x: 20, y: 100, width: controller.view.frame.width - 40, height: 48),
                    message: "This is an alert!",
                    style: .error,
                    showIcon: true,
                    alertInfo: alertInfo)
        
        controller.view.addSubview(dsAlertView)
        
        dsAlertView.translatesAutoresizingMaskIntoConstraints = false
        // Add constraints
        NSLayoutConstraint.activate([
            dsAlertView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            dsAlertView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16),
            dsAlertView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16),
            dsAlertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 48),
            dsAlertView.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor, constant: 26)
        ])
    }
}
