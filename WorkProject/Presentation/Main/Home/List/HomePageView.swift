//
//  HomeView.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

struct HomePageView: View {
    let viewModel: HomePageViewModel

    @Bindable var router: SelectedTabRouter

    var body: some View {
        NavigationStack(path: $router.homePath) {
            ZStack {
                backgroundColor
                VStack {
                    navigationBar
                    containerCardsTools
                }
            }
            .navigationDestination(for: CardTool.self) { _ in
                SketchToRenderDoneView()
                    .hidesTabBar(router)
            }
            .task {
                await viewModel.fetchCardTools()
            }
        }
    }

    private var backgroundColor: some View {
        Color(hex: "#F3F2F1")
            .ignoresSafeArea()
    }

    private var navigationBar: some View {
        HStack {
            GetProButton()
            Spacer()
            UserProfileButton()
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }

    private var containerCardsTools: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.cardsTools) { cardTool in
                    cardView(cardTool)
                }
            }
        }
    }

    private func cardView(_ cardTool: CardTool) -> some View {
        CardToolView(cardTool: cardTool) {
            router.push(cardTool: cardTool)
        }
    }
}

fileprivate extension View {
    func hidesTabBar(_ router: SelectedTabRouter) -> some View {
        self
            .onAppear  {
                withAnimation {
                    router.isTabBarHidden = true
                }
            }
            .onDisappear {
                withAnimation {
                    router.isTabBarHidden = false
                }
            }
    }
}

#Preview {
    HomePageView(
        viewModel: .init(),
        router: .init()
    )
}
