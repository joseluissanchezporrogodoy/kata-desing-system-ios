import UIKit
import DesignSystem

class AlertsViewController: UIViewController {
    private var alert: UIDSAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Configurando la información de la alerta con las acciones
        let alertInfo = ODSAlertInformation(
            first: ActionInformation(action: {
                print("Tap action triggered")
            }),
            second: ActionInformation(action: {
                print("Long press action triggered")
            }),
            dismissAction: {
                print("Dismiss action triggered")
            }
        )

        // Crear una instancia de UIDSAlert
        alert = UIDSAlert(
            title: "This is an alert!",
            style: .error,
            showIcon: true,
            alertInfo: alertInfo
        )

        if let alert = alert {
            // Configuración de la posición y tamaño de la alerta
            alert.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(alert)

            // Agregar constraints para centrar la alerta en la vista
            NSLayoutConstraint.activate([
                alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                alert.heightAnchor.constraint(equalToConstant: 48) // Agregamos una altura mínima
            ])
        }
    }
}
