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

        val uuidObj = UUID.fromString(params.conversationId)
        Log.i("uuidObj", uuidObj.toString())
        val uiConfig = UIConfiguration(coreConfig, uuidObj)
        val activity: Activity = activity

        UIClient.Factory.create(uiConfig)
            .openConversationActivity(activity)
    }

    fun validateChatParams(params: ChatParams): String? {
        if (params.serviceUrl.isNullOrEmpty() ||
            params.organizationId.isNullOrEmpty() ||
            params.developerName.isNullOrEmpty() ||
            params.conversationId.isNullOrEmpty()
        ) {
            return "Missing parameters: serviceUrl, organizationId, or developerName"
        }

        return try {
            UUID.fromString(params.conversationId)
            null
        } catch (e: IllegalArgumentException) {
            "UUID invalid"
        }

        return try {
            URL(params.serviceUrl)
            null
        } catch (e: Exception) {
            "Invalid serviceUrl format"
        }
    }
}
