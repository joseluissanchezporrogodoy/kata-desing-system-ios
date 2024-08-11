
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

```swift
let button = UIDSButton()
button.setTitle("Press Me", for: .normal)
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
```

#### UIDSAlert
A reusable alert view that can be used anywhere in the app.

```swift
let alert = UIDSAlert(title: "Warning", message: "This is a custom alert.")
alert.addAction(title: "OK", style: .default, handler: nil)
present(alert, animated: true, completion: nil)
```

### SwiftUI Components

#### DSButton
This button component is implemented in SwiftUI.

```swift
DSButton(action: {
    print("Button pressed")
}) {
    Text("Press Me")
}
```

#### DSAlert
A reusable alert component in SwiftUI that can be easily integrated.

```swift
DSAlert(isPresented: $showAlert, title: "Alert", message: "This is a SwiftUI alert.")
```

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

