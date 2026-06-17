//
//  GetProButton.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct GetProButton: View {

    var body: some View {
        Button {
            print("Tapped: \(self)")
        } label: {
            outerContainer
        }
    }

    private var outerContainer: some View {
        innerPill
            .background(LinearGradient.proGradient)
            .clipShape(.capsule)
            .padding(12)
    }

    private var innerPill: some View {
        getProLabel
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
    }

    private var getProLabel: some View {
        Text("GET PRO")
            .font(.system(size: 14, weight: .bold))
            .tracking(-0.07)
            .lineSpacing(2)
            .textCase(.uppercase)
            .foregroundStyle(.white)
    }
}

private extension LinearGradient {
    static var proGradient: LinearGradient {
        .init(
            colors: [
                Color(hex: "#FE9448"),
                Color(hex: "#B57BFF"),
                Color(hex: "#6981FF")
            ],
            startPoint: .leading,
            endPoint:   .trailing
        )
    }
}

#Preview {
    GetProButton()
}
