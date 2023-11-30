//
//  Renderer.mm
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/30/23.
//

#import "Renderer.hpp"
#import "ShaderTypes.hpp"
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

size_t alignedUniformsSize() {
    return (sizeof(UniformsArray) + 0xFF) & -0x100;
}

const intptr_t maxBuffersInFlight = 3;

__attribute__((objc_direct_members))
@interface Renderer ()
@property (retain, nonatomic) cp_layer_renderer_t layerRenderer;
@property (retain, nonatomic) id<MTLDevice> device;
@end

@implementation Renderer

- (instancetype)initWithLayerRenderer:(cp_layer_renderer_t)layerRenderer {
    if (self = [super init]) {
        id<MTLDevice> device = cp_layer_renderer_get_device(layerRenderer);
        id<MTLCommandQueue> commandQueue = [device newCommandQueue];
        
        self.layerRenderer = layerRenderer;
    }
    
    return self;
}

- (void)dealloc {
    [_layerRenderer release];
    [super dealloc];
}

- (void)startRenderLoop __attribute__((objc_direct)) {
    
}

@end
