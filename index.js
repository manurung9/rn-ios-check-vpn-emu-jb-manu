import { NativeModules } from 'react-native';
const { SecurityCheckModule } = NativeModules;

export async function getSecurityStatus() {
    return await SecurityCheckModule.getSecurityStatus();
}
