//
//  ProfileLink.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct UserProfileButton: View {
    var body: some View {
        Button {
            print("Tapped: \(self)")
        } label: {
            imageLabel
        }
        .frame(width: 44, height: 44)
    }

    private var imageLabel: some View {
        Image(.userIcon)
            .frame(width: 24, height: 24)
    }
}

#Preview {
    UserProfileButton()
}
