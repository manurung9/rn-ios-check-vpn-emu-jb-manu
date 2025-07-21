#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SecurityCheckModule, NSObject)

RCT_EXTERN_METHOD(getSecurityStatus:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)

@end
