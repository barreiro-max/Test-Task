//
//  CardTool.swift
//  WorkProject
//
//  Created by MaxAdmin on 16.06.2026.
//

import Foundation

struct CardTool: Identifiable, Hashable, Sendable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageTitle: String
}
