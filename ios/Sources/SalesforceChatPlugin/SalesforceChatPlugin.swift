import Foundation
import Capacitor
import UIKit

import SMIClientCore
import SMIClientUI

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(SalesforceChatPlugin)
public class SalesforceChatPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "SalesforceChatPlugin"
    public let jsName = "SalesforceChat"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "openMessaging", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = SalesforceChat()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func openMessaging(_ call: CAPPluginCall) {
        let params = ChatParams(
            serviceUrl: call.getString("Url"),
            organizationId: call.getString("OrganizationId"),
            developerName: call.getString("DeveloperName"),
            conversationId: call.getString("ConversationId")
        )

        if let error = implementation.validate(params: params) {
            call.reject(error)
            return
        }

        do {
            try implementation.presentChat(from: self.bridge?.viewController, with: params)
            call.resolve(["success": true])
        } catch {
            call.reject(error.localizedDescription)
        }
    }
}
