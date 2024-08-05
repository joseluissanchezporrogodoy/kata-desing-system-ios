import UIKit
import DesignSystem

class AlertsViewController: UIViewController {
    private var alert: UIODSAlert?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let alert = UIODSAlert(title: "info", text: "Lorem ipsum dolor sit amet Lorems",
                                 style: .info,
                                 showIcon: true,
                                 ODSAlertInformation: ODSAlertInformation(
                                    first: ActionInformation(
                                        action: {
                                            print("SwiftUI Action triggered")
                                        },
                                        actionTitle: "Button"),
                                    second: ActionInformation(
                                        action: {
                                            print("Button 2 Action triggered")
                                        },
                                        actionTitle: "Button2"),
                                    dismissAction: {
                                        self.alert?.isHidden = true
                                    })
        )
        alert.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alert)

        NSLayoutConstraint.activate([
            alert.topAnchor.constraint(equalTo: view.topAnchor),
            alert.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        self.alert = alert
    }
}
