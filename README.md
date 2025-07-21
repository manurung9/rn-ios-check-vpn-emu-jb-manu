# rn-ios-check-vpn-emu-jb-manu

![version](https://img.shields.io/npm/v/rn-ios-check-vpn-emu-jb-manu)
![license](https://img.shields.io/npm/l/rn-ios-check-vpn-emu-jb-manu)
![CI](https://github.com/yourusername/rn-ios-check-vpn-emu-jb-manu/actions/workflows/publish.yml/badge.svg)

React Native module to check **VPN**, **Jailbreak**, and **Emulator/Simulator** status on iOS devices.

<p align="center">
  <img src="logo.png" alt="logo" width="128" height="128">
</p>

## 🚀 Installation
```sh
npm install rn-ios-check-vpn-emu-jb-manu
cd ios && pod install
```

## 🧪 Usage
```ts
import { getSecurityStatus } from 'rn-ios-check-vpn-emu-jb-manu';

const checkSecurity = async () => {
  const status = await getSecurityStatus();
  console.log('Security Status:', status);

  /*
    Example output:
    {
      isVpnActive: false,
      isJailBroken: false,
      isDebugOrSimulator: true
    }
  */
};
```

### 📱 Alert example
```ts
import { Alert } from 'react-native';

Alert.alert('Security Check', JSON.stringify(status, null, 2));
```

### 📋 Pretty display example
```ts
const statusText = `
🔐 Jailbroken: ${status.isJailBroken ? 'Yes 🚨' : 'No ✅'}
🛡️ VPN Active: ${status.isVpnActive ? 'Yes 🔒' : 'No'}
🧪 Simulator: ${status.isDebugOrSimulator ? 'Yes 🧱' : 'No'}
`;

Alert.alert('Device Security', statusText);
```

## 🔗 Development Testing
You can test locally before publishing:

### Link into another project
```sh
cd rn-ios-check-vpn-emu-jb-manu
npm link

cd your-other-project
npm link rn-ios-check-vpn-emu-jb-manu
cd ios && pod install
```

### Publish
```sh
npm login
npm publish --access public
```

## 🐙 GitHub CI/CD (optional)
This library includes a GitHub Action workflow to automatically publish to npm on version tag push.

`.github/workflows/publish.yml`
```yaml
name: Publish to npm

on:
  push:
    tags:
      - 'v*'

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
          registry-url: 'https://registry.npmjs.org/'
      - run: npm install
      - run: npm publish
        env:
          NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

To enable this:
1. Push your repo to GitHub
2. Go to **Settings > Secrets > Actions**
3. Add secret: `NPM_TOKEN` with your npm access token
4. Tag release with `git tag v1.0.0 && git push origin v1.0.0`

## 🧩 Supported
- ✅ iOS 12+
- ✅ React Native 0.70+

## License
MIT

---

Enjoy using this library! Feel free to submit issues or pull requests 🙌
