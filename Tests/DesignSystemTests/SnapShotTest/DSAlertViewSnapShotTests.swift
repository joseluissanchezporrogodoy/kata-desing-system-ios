//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//
import XCTest
import SnapshotTesting
@testable import DesignSystem

final class DSAlertViewSnapshotTests: XCTestCase {

    func testDSAlertViewWithErrorStyle() throws {
        let alertInfo = ODSAlertInformation(first: nil, second: nil, dismissAction: nil)
        let dsAlertView = DSAlertView(message: "This is an error message.",
                                      style: .error,
                                      showIcon: true,
                                      alertInfo: alertInfo)
            .frame(width: 730)
            
        assertSnapshot(of: dsAlertView, as: .image)
    }
    
    func testDSAlertViewWithSuccessStyle() throws {
        let alertInfo = ODSAlertInformation(first: nil, second: nil, dismissAction: nil)
        let dsAlertView = DSAlertView(message: "This is a notification message.",
                                      style: .success,
                                      showIcon: true,
                                      alertInfo: alertInfo)
            .frame(width: 730)
        
        assertSnapshot(of: dsAlertView, as: .image)
    }
    
    func testDSAlertViewWithNotificationStyle() throws {
        let alertInfo = ODSAlertInformation(first: nil, second: nil, dismissAction: nil)
        let dsAlertView = DSAlertView(message: "This is a notification message.",
                                      style: .info,
                                      showIcon: true,
                                      alertInfo: alertInfo)
            .frame(width: 730)
        
        assertSnapshot(of: dsAlertView, as: .image)
    }
    
    func testDSAlertViewWithoutIcon() throws {
        let alertInfo = ODSAlertInformation(first: nil, second: nil, dismissAction: nil)
        let dsAlertView = DSAlertView(message: "This is a success message without icon.",
                                      style: .success,
                                      showIcon: false,
                                      alertInfo: alertInfo)
            .frame(width: 730)
        
        assertSnapshot(of: dsAlertView, as: .image)
    }
    
    func testDSAlertViewWithInfoStyle() throws {
        let alertInfo = ODSAlertInformation(first: nil, second: nil, dismissAction: nil)
        let dsAlertView = DSAlertView(message: "This is an informational message.",
                                      style: .info,
                                      showIcon: true,
                                      alertInfo: alertInfo)
            .frame(width: 730)
        
        assertSnapshot(of: dsAlertView, as: .image)
    }
    
    func testDSAlertViewWithActions() throws {
            let firstAction = ActionInformation(action: { print("Tapped") })
            let secondAction = ActionInformation(action: { print("Long Pressed") })
            let alertInfo = ODSAlertInformation(
                first: firstAction,
                second: secondAction,
                dismissAction: { print("Dismissed") }
            )
            let dsAlertView = DSAlertView(message: "Test message with actions",
                                          style: .error,
                                          showIcon: true,
                                          alertInfo: alertInfo)
            .frame(width: 730)
            
        assertSnapshot(of: dsAlertView, as: .image)
    }
}
