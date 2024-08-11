import UIKit
import DesignSystem

class AlertsViewController: UIViewController {
    private var alert: UIDSAlert?
    private let actionButton: UIButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        actionButton.setTitle("Show Alert", for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.topAnchor.constraint(equalTo: alert?.bottomAnchor ?? view.centerYAnchor, constant: 20)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    @objc private func buttonPressed() {
           print("Button was pressed!")
           // Aquí puedes agregar cualquier acción adicional que desees
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
        self.showAlertshow(title: "Hola Mundio", style: .error, alertInfo: alertInfo)
       }
}
