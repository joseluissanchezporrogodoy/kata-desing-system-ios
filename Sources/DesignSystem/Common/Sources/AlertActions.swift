import Foundation

/// `ActionInformation` is a struct that encapsulates an action.
///
/// The action is a function of type `() -> Void`, which means it takes no parameters and returns no value.
/// This struct is useful for encapsulating any action that needs to be executed later, allowing it to be passed around and handled
/// easily within your code.
public struct ActionInformation {
    public let action: () -> Void
    /// Initializes a new instance of `ActionInformation` with the specified action.
    ///
    /// - Parameter action: The action to be encapsulated. It must be a function that takes no parameters and returns no value.
    public init(action: @escaping () -> Void) {
        self.action = action
    }
}

/// `ODSAlertInformation` is a struct that encapsulates information related to an alert.
///
/// This struct contains up to two optional actions (`first` and `second`) and an optional dismiss action (`dismissAction`).
/// It is useful for representing the behavior and options available in an alert.
///
/// Usage examples might include defining actions to take when a user responds to a confirmation dialog
/// or when the alert is dismissed.
public struct ODSAlertInformation {
    public let first: ActionInformation?
    public let second: ActionInformation?
    public let dismissAction: (() -> Void)?
    // Initializes a new instance of `ODSAlertInformation` with the specified actions.
    ///
    /// - Parameters:
    ///   - first: The first action of the alert, encapsulated in an `ActionInformation` instance.
    ///   - second: The second action of the alert, encapsulated in an `ActionInformation` instance.
    ///   - dismissAction: The action that will be executed when the alert is dismissed. It must be a function that takes no parameters and returns no value.
    public init(first: ActionInformation?, second: ActionInformation?, dismissAction: (() -> Void)?) {
        self.first = first
        self.second = second
        self.dismissAction = dismissAction
    }
}
