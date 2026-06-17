//
//  SketchSecondaryButton.swift
//  WorkProject
//
//  Created by MaxAdmin on 17.06.2026.
//

import SwiftUI

struct SketchSecondaryButton: View {
    let text: String
    let image: String

    let onAction: () -> Void

    var body: some View {
        Button(action: onAction) {
            label
        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .controlSize(.small)
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color(hex: "#CECED0"), lineWidth: 1)
        }
        .tint(.white)
        .buttonStyle(.borderedProminent)
    }

    private var label: some View {
        HStack {
            Image(image)
                .frame(width: 24, height: 24)

            Text(text)
                .font(.system(size: 14, weight: .medium))
                .tracking(-0.063)
                .lineSpacing(6)
                .multilineTextAlignment(.center)
                .frame(width: 44, height: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.black)
    }
}

#Preview {
    HStack(spacing: 8) {
        SketchSecondaryButton(
            text: "Resize",
            image: "resize"
        ) {
            print("Tapped: resize SketchSecondaryButton()")
        }
        SketchSecondaryButton(
            text: "Save",
            image: "save"
        ) {
            print("Tapped: save SketchSecondaryButton()")
        }
    }
}
