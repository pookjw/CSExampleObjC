//
//  ShaderTypes.hpp
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 12/1/23.
//

#ifndef ShaderTypes_hpp
#define ShaderTypes_hpp

#ifdef __METAL_VERSION_
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
typedef metal::int32_t EnumBackingType
#else
#import <Foundation/Foundation.h>
typedef NSInteger EnumBackingType;
#endif

#include <simd/simd.h>

typedef NS_ENUM(EnumBackingType, BufferIndex) {
    BufferIndexMeshPositions = 0,
    BufferIndexMeshGenerics = 1,
    BufferIndexUniforms = 2
};

typedef NS_ENUM(EnumBackingType, VertexAttribute) {
    VertexAttributePosition = 0,
    VertexAttributeTexcoord = 1
};

typedef NS_ENUM(EnumBackingType, TextureIndex) {
    TextureIndexColor = 0
};

typedef struct {
    matrix_float4x4 projectionMatrix;
    matrix_float4x4 modelViewMatrix;
} Uniforms;

typedef struct {
    Uniforms uniforms[2];
} UniformsArray;

#endif /* ShaderTypes_hpp */
