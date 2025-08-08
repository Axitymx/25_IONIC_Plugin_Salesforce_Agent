import { registerPlugin } from '@capacitor/core';

import type { SalesforceChatPlugin } from './definitions';

const SalesforceChat = registerPlugin<SalesforceChatPlugin>('SalesforceChat');

export * from './definitions';
export { SalesforceChat };