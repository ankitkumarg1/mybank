//
//  Transaction.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import Foundation

struct Transaction: Identifiable, Sendable {

    let id: UUID
    let title: String
    let amount: Double
    let category: Category
    let date: Date

    enum Category: String, Sendable {
        case food
        case shopping
        case travel
        case bills
        case salary
        case other
    }
}
