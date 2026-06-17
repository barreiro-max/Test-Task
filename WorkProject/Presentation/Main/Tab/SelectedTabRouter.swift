//
//  SelectedTab.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import SwiftUI

@MainActor
@Observable
final class SelectedTabRouter {

    enum Tab: Int, CaseIterable {
        case tools
        case gallery
        case discover

        var isActive: Bool {
            if case self = .tools { true } else { false }
        }

        var title: String {
            switch self {
            case .tools: "Tools"
            case .gallery: "Gallery"
            case .discover: "Discover"
            }
        }

        var icon: String {
            switch self {
            case .tools: "tools"
            case .gallery: "gallery"
            case .discover: "discover"
            }
        }
    }

    var currentTab: Tab = .tools
    var isTabBarHidden: Bool = false

    var homePath = NavigationPath()

    func push(cardTool: CardTool) {
        homePath.append(cardTool)
    }
}
