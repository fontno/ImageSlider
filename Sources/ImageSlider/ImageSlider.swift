//
//  ImageSlider.swift
//
//
//  Created by Brian Fontenot on 8/4/24.
//

import SwiftUI

/// An ImageSlider to compare two images
public struct ImageSlider: View {

    @State private var sliderOffset: CGFloat = 0
    
    @State private var previousSliderOffset: CGFloat = 0
    
    @State private var distance: CGFloat = 0.5
    
    /// The left hand image to compare
    private var lhs: UIImage
    
    /// The right hand image to compare
    private var rhs: UIImage
    
    public var body: some View {
        GeometryReader { geometry in
            Image(uiImage: lhs)
                .resizable()
                .overlay {
                    Image(uiImage: rhs)
                        .resizable()
                        .visualEffect { content, geometryProxy in
                            content
                                .colorEffect(ShaderLibrary.sliderComposite(.float(Float(distance)), .float(geometryProxy.size.width)), isEnabled: true)
                        }
                    }
                .overlay(
                    Group {
                        Rectangle()
                            .fill(Material.regular)
                            .fill(Color.white)
                            .frame(width: 4)
                            .offset(x: sliderOffset)
                            .overlay {
                                Circle()
                                    .fill(Material.regular)
                                    .fill(.white)
                                    .frame(width: 40, height: 40)
                                    .offset(x: sliderOffset)
                                    .overlay {
                                        HStack {
                                            Image(systemName: "chevron.left")
                                                .bold()
                                                .foregroundStyle(Color.gray)
                                            Image(systemName: "chevron.right")
                                                .bold()
                                                .foregroundStyle(Color.gray)
                                        }
                                        .offset(x: sliderOffset)
                                    }
                            }
                    }
                )
                .gesture(
                    DragGesture()
                        .onChanged({ drag in
                                sliderOffset = previousSliderOffset + drag.translation.width
                                distance = drag.location.x / geometry.size.width
                        })
                        .onEnded({ drag in
                                previousSliderOffset += drag.translation.width
                        })
                )
                .onTapGesture(count: 2, perform: {
                    sliderOffset = 0
                    previousSliderOffset = 0
                    distance = 0.5
                })
            }
    }
}
