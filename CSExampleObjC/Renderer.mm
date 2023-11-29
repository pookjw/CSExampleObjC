//
//  Renderer.mm
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/30/23.
//

#import "Renderer.hpp"

__attribute__((objc_direct_members))
@interface Renderer ()
@end

@implementation Renderer

- (instancetype)initWithLayerRenderer:(cp_layer_renderer_t)layerRenderer {
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)startRenderLoop __attribute__((objc_direct)) {
    
}

@end
