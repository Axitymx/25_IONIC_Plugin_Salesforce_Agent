# @capacitor/salesforce-chat

Plugin for implementing Salesforce chat

## Install

```bash
npm install @capacitor/salesforce-chat
npx cap sync
```

## Configuration in the Android project
In the `android/build.gradle` file (project level), make sure to add the following block inside `repositories`:
```gradle
repositories {
    google()
    mavenCentral()
    maven { url = uri("https://s3.amazonaws.com/inapp.salesforce.com/public/android") }
}
```

Use version 35 for the build SDK and target
```gradle
android {
    compileSdkVersion 35

    defaultConfig {
        targetSdkVersion 35
    }
}
```

## Example
```typescript
SalesforceChat.openMessaging({
    Url: "https://test.salesforce",
    OrganizationId: "TestOrganization",
    DeveloperName: "TestDeveloper"
}).then(() => {
    console.log('SalesforcePlugin:', 'Salesforce chat open');
}).catch((error: any) => {
    console.log("SalesforcePlugin:", error);
});
```

## Documentation
Complete documentation of [SalesforceChatPlugin](./Models.md). methods, properties, and interfaces.