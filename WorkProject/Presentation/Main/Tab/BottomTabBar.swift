//
//  BottomTabBar.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct BottomTabBar: View {
    let tab: SelectedTabRouter.Tab
    let onChangeCurrentTab: (SelectedTabRouter.Tab) -> Void

    var body: some View {
        ZStack {
            background

            HStack {
                ForEach(
                    SelectedTabRouter.Tab.allCases,
                    id: \.self
                ) { tab in
                    Spacer()
                    tabButton(tab)
                    Spacer()
                }
            }
        }
        .frame(width: 343, height: 50)
        .shadow(
            color: .black.opacity(0.04),
            radius: 8,
            x: 2, y: 2
        )
    }

    private var background: some View {
        RoundedRectangle(cornerRadius: 96)
            .fill(.white)
    }

    private func tabButton(_ tab: SelectedTabRouter.Tab) -> some View {
        Button {
            onChangeCurrentTab(tab)
        } label: {
            buttonlabel(tab)
        }
        .tint(.black)
    }

    private func buttonlabel(_ tab: SelectedTabRouter.Tab) -> some View {
        VStack {
            Image(tab.icon)
                .frame(width: 24, height: 24)

            Text(tab.title)
                .font(.system(size: 10, weight: .medium))
                .tracking(-0.24)
        }
        .frame(width: 75, height: 50)
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        BottomTabBar(tab: .tools) { tab in
            print("Selected: \(tab)")
        }
    }
}
