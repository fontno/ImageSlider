//
//  Shaders.metal
//
//
//  Created by Brian Fontenot on 8/4/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 sliderComposite(float2 position, half4 currentColor, float touch, float width) {
    float normalizedPosition = position.x / width;
    
    half4 color = normalizedPosition >= touch ? currentColor : half4(0.0, 0.0, 0.0, 0.0);
    return color;
}
