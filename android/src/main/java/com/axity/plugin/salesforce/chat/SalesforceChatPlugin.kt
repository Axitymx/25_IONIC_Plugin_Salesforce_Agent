package com.axity.plugin.salesforce.chat

import com.getcapacitor.JSObject
import com.getcapacitor.Plugin
import com.getcapacitor.PluginCall
import com.getcapacitor.PluginMethod
import com.getcapacitor.annotation.CapacitorPlugin


@CapacitorPlugin(name = "SalesforceChat")
class SalesforceChatPlugin : Plugin() {
    private val implementation = SalesforceChat()

    @PluginMethod
    fun echo(call: PluginCall) {
        val value = call.getString("value")

        val ret = JSObject()
        ret.put("value", implementation.echo(value!!))
        call.resolve(ret)
    }

    @PluginMethod
    fun openMessaging(call: PluginCall) {
        val params = ChatParams(
            serviceUrl = call.getString("Url"),
            organizationId = call.getString("OrganizationId"),
            developerName = call.getString("DeveloperName")
        )

        val validationError = implementation.validateChatParams(params)
        if (validationError != null) {
            call.reject(validationError)
            return
        }

        try {
            implementation.openChat(activity, params)
            call.resolve()
        } catch (e: Exception) {
            call.reject(e.message)
        }
    }
}