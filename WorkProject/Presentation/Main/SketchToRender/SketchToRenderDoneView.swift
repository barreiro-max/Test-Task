//
//  File.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct SketchToRenderDoneView: View {
    var body: some View {
        ZStack {
            backgroundColor

            VStack(spacing: 64) {
                containerCardTools
                containerBottomButtons
            }
        }
    }

    private var backgroundColor: some View {
        Color(hex: "#F3F2F1")
            .ignoresSafeArea()
    }

    private var containerCardTools: some View {
        SketchToRenderImage()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 16)
            .padding(.bottom, 48)
            .padding(.horizontal, 16)
    }

    private var containerBottomButtons: some View {
        VStack(spacing: 16) {

            HStack(spacing: 8) {
                resizeButton
                saveButton
            }

            regenerateButton
        }
        .buttonStyle(.borderedProminent)
        .frame(width: 375)
        .padding(16)
    }

    private var resizeButton: some View {
        SketchSecondaryButton(
            text: "Resize",
            image: "resize"
        ) {
            print("Resize button tapped")
        }
    }

    private var saveButton: some View {
        SketchSecondaryButton(
            text: "Save",
            image: "save"
        ) {
            print("Save button tapped")
        }
    }

    private var regenerateButton: some View {
        Button {
            print("Regenerate button tapped")
        } label: {
            regererateLabel
        }
        .controlSize(.large)
        .tint(.black)
    }

    private var regererateLabel: some View {
        HStack {
            Image("regenerate")
                .frame(width: 24, height: 24)

            Text("Regenerate")
                .font(.system(size: 16, weight: .medium))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .frame(height: 24)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SketchToRenderDoneView()
}
