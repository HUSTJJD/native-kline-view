#import "RNKLineView-Swift.h"
#import "RCTViewManager.h"
#import "RCTUIManager.h"


@interface RCT_EXTERN_MODULE(RNKLineView, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(onDrawItemDidTouch, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDrawItemComplete, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDrawPointComplete, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onLoadMoreBegin, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(optionList, NSString)

RCT_EXTERN_METHOD(resetLoadMoreEnd:(nonnull NSNumber *)reactTag)

RCT_EXTERN_METHOD(setLoadMoreEnd:(nonnull NSNumber *)reactTag)

@end

@implementation RNKLineView (Commands)

RCT_EXPORT_METHOD(resetLoadMoreEnd:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        UIView *view = viewRegistry[reactTag];
        if ([view isKindOfClass:[HTKLineContainerView class]]) {
            [(HTKLineContainerView *)view resetLoadMoreEnd:reactTag];
        }
    }];
}

RCT_EXPORT_METHOD(setLoadMoreEnd:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        UIView *view = viewRegistry[reactTag];
        if ([view isKindOfClass:[HTKLineContainerView class]]) {
            [(HTKLineContainerView *)view setLoadMoreEnd:reactTag];
        }
    }];
}

@end

