## API

<docgen-index>

* [`openMessaging(...)`](#openmessaging)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### openMessaging(...)

```typescript
openMessaging(params: SalesforceMessagingParams) => Promise<void>
```

| Param        | Type                                                                            | Description                                                                |
| ------------ | ------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| **`params`** | <code><a href="#salesforcemessagingparams">SalesforceMessagingParams</a></code> | - An`SalesforceMessagingParams` object containing salesforce configuration |

--------------------


### Interfaces


#### SalesforceMessagingParams

Represents the parameters required to configure Salesforce Embedded Messaging.

| Prop                 | Type                |
| -------------------- | ------------------- |
| **`Url`**            | <code>string</code> |
| **`OrganizationId`** | <code>string</code> |
| **`DeveloperName`**  | <code>string</code> |
| **`ConversationId`** | <code>string</code> |

</docgen-api>
