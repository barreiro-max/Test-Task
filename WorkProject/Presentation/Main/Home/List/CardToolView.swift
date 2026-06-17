//
//  CardToolView.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct CardToolView: View {
    let cardTool: CardTool
    let onTapImageNavigation: () -> Void

    var body: some View {
        ZStack {
            background

            VStack(alignment: .leading) {
                image

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {
                    title
                    subtitle
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12)
        }
        .overlay(alignment: .bottomTrailing) {
            navigationButton(cardTool)
        }
        .frame(width: 343, height: 233)
    }

    private var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
    }

    private var image: some View {
        Image(cardTool.imageTitle)
            .onTapGesture {
                onTapImageNavigation()
            }
    }

    private var title: some View {
        Text(cardTool.title)
            .font(.system(size: 16, weight: .semibold))
            .frame(width: 230, height: 24, alignment: .leading)
    }

    private var subtitle: some View {
        Text(cardTool.subtitle)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.secondary)
            .tracking(14 * -0.0045)
            .lineSpacing(8)
            .multilineTextAlignment(.leading)
            .frame(width: 230, height: 44, alignment: .topLeading)
    }

    private func navigationButton(_ cardTool: CardTool) -> some View {
        Button{
            onTapImageNavigation()
        } label: {
            navigationButtonLabel
        }
        .buttonStyle(.plain)
    }

    private var navigationButtonLabel: some View {
        ZStack {
            Capsule()
                .fill(.black)

            Image(systemName: "arrow.right")
                .foregroundStyle(.white)
        }
        .frame(width: 49, height: 32)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .shadow(
            color: .black.opacity(0.04),
            radius: 16,
            x: 5,
            y: 4
        )
    }
}

#Preview {
    let testCard = CardTool(
        title: "Redesign",
        subtitle: "Refresh your space with a new interior look",
        imageTitle: "redesignImage"
    )

    ZStack {
        Color.gray
            .ignoresSafeArea()
        CardToolView(cardTool: testCard) {
            print("Tapped navigation callback")
        }
        .fixedSize()
    }
}
