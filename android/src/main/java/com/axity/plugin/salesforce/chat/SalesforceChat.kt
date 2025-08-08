package com.axity.plugin.salesforce.chat

import android.app.Activity
import android.util.Log
import com.salesforce.android.smi.core.CoreConfiguration
import com.salesforce.android.smi.ui.UIClient
import com.salesforce.android.smi.ui.UIConfiguration
import java.net.URL
import java.util.UUID

class SalesforceChat {
    fun echo(value: String): String {
        Log.i("Echo", value)
        return value
    }

    fun openChat(activity: Activity, params: ChatParams) {
        val serviceUrl = URL(params.serviceUrl!!)
        val coreConfig = CoreConfiguration(serviceUrl, params.organizationId!!, params.developerName!!)
        val uiConfig = UIConfiguration(coreConfig, UUID.randomUUID())
        val activity: Activity = activity

        UIClient.Factory.create(uiConfig)
            .openConversationActivity(activity)
    }

    fun validateChatParams(params: ChatParams): String? {
        if (params.serviceUrl.isNullOrEmpty() ||
            params.organizationId.isNullOrEmpty() ||
            params.developerName.isNullOrEmpty()
        ) {
            return "Missing parameters: serviceUrl, organizationId, or developerName"
        }

        return try {
            URL(params.serviceUrl)
            null
        } catch (e: Exception) {
            "Invalid serviceUrl format"
        }
    }
}
