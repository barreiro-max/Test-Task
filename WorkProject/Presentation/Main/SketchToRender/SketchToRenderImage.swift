//
//  sketchToRenderImage.swift
//  WorkProject
//
//  Created by MaxAdmin on 17.06.2026.
//

import SwiftUI

struct SketchToRenderImage: View {
    @GestureState var dragOffset: CGSize = .zero

    var body: some View {
        ZStack {
            imageGeometryContainer
            animatedSlider
        }
        .frame(width: 343, height: 436)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .overlay(alignment: .top) {
            overlayLabels
        }
    }

    private var imageGeometryContainer: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                let center = geo.size.width / 2
                let clampedOffset = min(max(dragOffset.width, -center), center)
                let maskWidth = center + clampedOffset

                beforeImage
                afterImageWithMask(maskWidth)
            }
        }
    }

    private var beforeImage: some View {
        Image("sketchToRenderImageBefore")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 343, height: 436)
    }

    private func afterImageWithMask(_ maskWidth: CGFloat) -> some View {
        Image("sketchToRenderImageAfter")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 343, height: 436)
            .mask(alignment: .leading) {
                afterImageMask(maskWidth)
            }
            .animation(.spring, value: dragOffset)
    }

    private func afterImageMask(_ maskWidth: CGFloat) -> some View {
        HStack {
            Color.black
                .frame(width: maskWidth)
            Color.clear
        }
    }

    private var animatedSlider: some View {
        SketchToRenderImageSlider()
            .offset(x: dragOffset.width, y: 0)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, transaction in
                        state = value.translation
                    }
            )
            .animation(.spring, value: dragOffset)
    }


    private var overlayLabels: some View {
        HStack {
            imageLabel("Before")
            Spacer()
            imageLabel("After")
        }
        .frame(height: 55)
    }

    private func imageLabel(_ text: String) -> some View {

        Text(text)
            .font(.system(size: 14, weight: .semibold))
            .tracking(-0.45)
            .multilineTextAlignment(.center)

            .frame(width: 56)
            .padding(.vertical, 6)

            .foregroundStyle(.black)
            .background(.white.opacity(0.8))
            .clipShape(.capsule)

            .padding(.horizontal, 10)

    }
}

#Preview {
    SketchToRenderImage()
}
