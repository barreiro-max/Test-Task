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

    private var tabOverlay: some View {
        VStack {
            if !router.isTabBarHidden {
                BottomTabBar(tab: router.currentTab) { tab in
                    router.currentTab = tab
                }
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    TabView()
}
