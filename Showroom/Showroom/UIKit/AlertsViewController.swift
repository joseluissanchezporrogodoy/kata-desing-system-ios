import UIKit
import DesignSystem

class AlertsViewController: UIViewController {

    private var actionButton: UIDSButton!
    private var actionButton1: UIDSButton!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupButtons() // Llama al método para configurar los botones
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButtons() // Llama al método para configurar los botones
    }

    private func setupButtons() {
        actionButton = UIDSButton(frame: .zero, message: "Show Alert", style: .primary) { [weak self] in
            self?.buttonPressed()
        }
        
        actionButton1 = UIDSButton(frame: .zero, message: "Show Alert1", style: .alternative) { [weak self] in
            self?.button1Pressed()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(actionButton)
        view.addSubview(actionButton1)
        
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
