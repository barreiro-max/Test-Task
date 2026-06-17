//
//  HomePageViewModel.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import Observation

@MainActor
@Observable
final class HomePageViewModel {
    private(set) var cardsTools = [CardTool]()

    func fetchCardTools() async {
        cardsTools = [
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            ),
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            ),
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            ),
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            ),
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            ),
            CardTool(
                title: "Redesign",
                subtitle: "Refresh your space with a new interior look",
                imageTitle: "redesignImage"
            )
        ]
    }
}
