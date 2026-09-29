//
//  APIClient.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import Foundation

actor APIClient {

    static let shared = APIClient()

    private init() {}

    func fetchBalance() async throws -> Double {

        // Simulate network delay
        try await Task.sleep(for: .milliseconds(800))

        return 125_000
    }

    func fetchTransactions() async throws -> [Transaction] {

        // Simulate network delay
        try await Task.sleep(for: .milliseconds(1_000))

        return [
            Transaction(
                id: UUID(),
                title: "Salary",
                amount: 90_000,
                category: .salary,
                date: Date()
            ),

            Transaction(
                id: UUID(),
                title: "Amazon",
                amount: -2_500,
                category: .shopping,
                date: Date()
            ),

            Transaction(
                id: UUID(),
                title: "Swiggy",
                amount: -450,
                category: .food,
                date: Date()
            ),

            Transaction(
                id: UUID(),
                title: "Electricity Bill",
                amount: -2_000,
                category: .bills,
                date: Date()
            ),

            Transaction(
                id: UUID(),
                title: "Flight Ticket",
                amount: -8_000,
                category: .travel,
                date: Date()
            )
        ]
    }
}
