//
//  TabView.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct TabView: View {
    @State private var router = SelectedTabRouter()

    @State var viewModel = HomePageViewModel()

    var body: some View {
        Group {
            switch router.currentTab {
            case .tools:
                HomePageView(
                    viewModel: viewModel,
                    router: router
                )
            case .gallery:
                GalleryView()
            case .discover:
                DiscoverView()
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .overlay(alignment: .bottom) {
            tabOverlay
        }
    }

    @ViewBuilder
    private var tabOverlay: some View {
        if !router.isTabBarHidden {
            ZStack {
                bottomFading
                tabBar
            }
            .transition(.opacity)
        }
    }

    private var bottomFading: some View {
        LinearGradient(
            colors: [
                .clear,
                Color(hex: "#F3F2F1").opacity(0.85)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea(.container, edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: 96)
    }


    private var tabBar: some View {
        BottomTabBar(tab: router.currentTab) { tab in
            router.currentTab = tab
        }
    }
}

#Preview {
    TabView()
}
