
# Kata Design System iOS

This project is a modular design system for iOS, developed with Swift. The system includes reusable components in UIKit and SwiftUI, facilitating the creation of consistent and efficient interfaces.

## Prerequisites

- **Xcode 14.0 or higher**
- **Swift 5.7 or higher**
- **macOS Ventura 13.0 or higher**

## Installation

To install and run this project on your local machine, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/kata-design-system-ios.git
   cd kata-design-system-ios
   ```

2. **Open the project in Xcode**:
   ```bash
   open kata-design-system-ios/Showroom/Showroom.xcodeproj
   ```

3. **Install dependencies**:
   If you are using Swift Package Manager, dependencies will be resolved automatically when you open the project in Xcode.

4. **Run the application**:
   Select the `Showroom` scheme and press `Cmd + R` to run the application in the simulator or on a physical device.

## Component Demonstration

### UIKit Components

#### UIDSButton
This customizable button uses UIKit and is a key part of the design system.

Here’s an example of how to use `UIDSButton` within a `UIViewController`:

```swift
class AlertsViewController: UIViewController {

    private var actionButton: UIDSButton!
    private var actionButton1: UIDSButton!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupButtons() // Call the method to set up the buttons
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButtons() // Call the method to set up the buttons
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
        self.showAlert(title: "Hola Mundo", style: .error, alertInfo: alertInfo)
    }
}
```

This example shows how to set up and use `UIDSButton` within a `UIViewController` and how to handle button presses.

#### UIDSAlert
A reusable alert view that integrates SwiftUI into UIKit, allowing you to display a SwiftUI-based alert in UIKit applications.

Here’s how to display an alert using `UIDSAlert`:

```swift
public extension UIDSAlert {
    static func show(title: String, style: AlertStyle, alertInfo: ODSAlertInformation, controller: UIViewController) {
      
        let dsAlertView = UIDSAlert(
            frame: CGRect(x: 20, y: 100, width: controller.view.frame.width - 40, height: 48),
            message: "This is an alert!",
            style: .error,
            showIcon: true,
            alertInfo: alertInfo
        )
        
        controller.view.addSubview(dsAlertView)
        
        dsAlertView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            dsAlertView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            dsAlertView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16),
            dsAlertView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16),
            dsAlertView.heightAnchor.constraint(greaterThanOrEqualToConstant: 48),
            dsAlertView.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor, constant: 26)
        ])
    }
}
```

To present the alert within a view controller:

```swift
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
    self.showAlert(title: "Hola Mundo", style: .error, alertInfo: alertInfo)
}
```

### SwiftUI Components

#### DSButton
This button component is implemented in SwiftUI.

```swift
DSButton(title: "Press Me", action: {
    print("Button pressed")
})
```

#### DSAlert
A reusable alert component in SwiftUI that can be easily integrated using a view modifier.

To display a `DSAlert` in your SwiftUI view, you can use the `showDSAlert` modifier. Here's an example:

```swift
struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            DSButton(title: "Show Alert", action: {
                showAlert = true
            })
        }
        .showDSAlert(showAlert: $showAlert, alertView: DSAlert(title: "Alert", message: "This is a SwiftUI alert."))
    }
}
```

This example demonstrates how to use `DSAlert` in a SwiftUI view. The `DSAlert` is presented when the `showAlert` state is set to `true`, and it can be customized to include various actions and styles.

## Project Architecture

The project follows a modular structure that separates components into folders based on their technology (UIKit, SwiftUI, Common). This allows for easy extensibility and maintenance of the design system.

- **Sources/DesignSystem**: Contains the reusable components of the design system.
- **Showroom**: A sample app that demonstrates how to integrate and use the components in a real application.

## Testing

To run unit and UI tests:

1. Select the `DesignSystemTests` scheme.
2. Press `Cmd + U` to run all tests.

## Contributions

Contributions are welcome. If you want to contribute:

1. Fork the project.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push the branch (`git push origin feature/new-feature`).
5. Open a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

