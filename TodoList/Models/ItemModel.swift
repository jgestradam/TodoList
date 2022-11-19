//
//  ItemModel.swift
//  TodoList
//
//  Created by Joseph Estrada on 11/19/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

