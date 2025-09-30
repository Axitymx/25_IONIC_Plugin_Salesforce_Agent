/**
 * Represents the parameters required to configure Salesforce Embedded Messaging.
 *
 * @interface SalesforceMessagingParams
 *
 * @property {string} Url - The base URL for the Salesforce Embedded Messaging service.
 * @property {string} OrganizationId - The Salesforce organization identifier.
 * @property {string} DeveloperName - The developer-defined name for the Salesforce deployment.
 * @property {string} ConversationId - The conversation identifier type UUID.
 */
export interface SalesforceMessagingParams {
  Url: string;
  OrganizationId: string;
  DeveloperName: string;
  ConversationId: string;
}

export interface SalesforceChatPlugin {
  /**
   * @method openMessaging
   * Open a Salesforce messaging session
   * @param params - An`SalesforceMessagingParams` object containing salesforce configuration
   */
  openMessaging(params: SalesforceMessagingParams): Promise<void>;
}
