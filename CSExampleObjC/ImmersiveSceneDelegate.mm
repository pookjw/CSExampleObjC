//
//  ImmersiveSceneDelegate.mm
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/29/23.
//

#import "ImmersiveSceneDelegate.hpp"
#import "Renderer.hpp"
#import <CompositorServices/CompositorServices.h>
#import <objc/message.h>
#import <objc/runtime.h>

@interface ImmersiveSceneDelegate ()
@property (retain, nonatomic, direct) Renderer *renderer;
@end

@implementation ImmersiveSceneDelegate

- (void)dealloc {
    [_window release];
    [_renderer release];
    [super dealloc];
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    reinterpret_cast<void (*)(id, SEL, id)>(objc_msgSend)(scene, NSSelectorFromString(@"setConfigurationProvider:"), self);
    
    cp_layer_renderer_t layerRenderer = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(scene, NSSelectorFromString(@"layer"));
    
    Renderer *renderer = [[Renderer alloc] initWithLayerRenderer:layerRenderer];
    [renderer startRenderLoop];
    self.renderer = renderer;
    [renderer release];
}

// CPConfigurationProvider
- (cp_layer_renderer_configuration_t)layerConfigurationWithDefaultConfiguration:(cp_layer_renderer_configuration_t)defaultConfiguration layerCapabilites:(cp_layer_renderer_capabilities_t)layerCapabilites {
    cp_layer_renderer_configuration_t copy = [defaultConfiguration copy];
    cp_layer_renderer_configuration_set_layout(copy, cp_layer_renderer_layout_dedicated);
    cp_layer_renderer_configuration_set_foveation_enabled(copy, cp_layer_renderer_capabilities_supports_foveation(layerCapabilites));
    cp_layer_renderer_configuration_set_color_format(copy, MTLPixelFormatRGBA16Float);
    
    return [copy autorelease];
}

@end
