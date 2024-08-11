import UIKit
import DesignSystem

class AlertsViewController: UIViewController {
    
    private let actionButton: UIButton = UIButton(type: .system)
    private let actionButton1: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Configurar actionButton
        actionButton.setTitle("Show Alert", for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // Configurar actionButton1
        actionButton1.setTitle("Show Alert1", for: .normal)
        actionButton1.translatesAutoresizingMaskIntoConstraints = false
        actionButton1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        
        // Añadir botones a la vista
        view.addSubview(actionButton)
        view.addSubview(actionButton1)
        
        // Configurar restricciones para centrar los botones y colocar actionButton1 debajo de actionButton
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            actionButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton1.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func buttonPressed() {
        print("Button was pressed!")
        
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
        self.showAlertshow(title: "Hola Mundo", style: .error, alertInfo: alertInfo)
    }
    
    @objc private func button1Pressed() {
        print("Button1 was pressed!")
        
        let alertInfo = ODSAlertInformation(
            first: ActionInformation(action: {
                print("Tap action triggered for Button1")
            }),
            second: ActionInformation(action: {
                print("Long press action triggered for Button1")
            }),
            dismissAction: {
                print("Dismiss action triggered for Button1")
            }
        )
        self.showRecicledAlertshow(title: "Hello World Again", style: .success, alertInfo: alertInfo)
    }
}
