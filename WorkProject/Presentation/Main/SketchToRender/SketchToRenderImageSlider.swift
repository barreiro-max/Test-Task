//
//  SketchToRenderDrag.swift
//  WorkProject
//
//  Created by MaxAdmin on 17.06.2026.
//

import SwiftUI

struct SketchToRenderImageSlider: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: 3, maxHeight: .infinity)

            Circle()
                .fill(.white)
                .frame(width: 44, height: 44)
                .padding(.vertical, 11)
                .padding(.horizontal, 8)
                .shadow(
                    color: .black.opacity(0.25),
                    radius: 4,
                    x: 0, y: 4
                )
                .overlay {
                    imageSlider
                }
        }
    }

    private var imageSlider: some View {
        Image(systemName: "chevron.up.chevron.down")
            .font(.system(size: 20, weight: .regular))
            .rotationEffect(.degrees(90))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        SketchToRenderImageSlider()
    }
}
