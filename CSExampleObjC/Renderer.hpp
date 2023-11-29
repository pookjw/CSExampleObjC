//
//  Renderer.hpp
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/30/23.
//

#import <CompositorServices/CompositorServices.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_direct_members))
@interface Renderer : NSObject
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithLayerRenderer:(cp_layer_renderer_t)layerRenderer;
- (void)startRenderLoop;
@end

NS_ASSUME_NONNULL_END
