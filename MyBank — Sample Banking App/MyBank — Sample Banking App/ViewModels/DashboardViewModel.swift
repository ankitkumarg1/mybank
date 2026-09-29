//
//  DashboardViewModel.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import Foundation
import Combine

@MainActor
final class DashboardViewModel: ObservableObject {

    @Published private(set) var balance: Double = 0
    @Published private(set) var transactions: [Transaction] = []
    @Published private(set) var statistics: Statistics?
    @Published private(set) var isLoading = false

    @Published private(set) var errorMessage: String?

    private let apiClient = APIClient.shared

    func loadDashboard() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {

            async let balanceRequest = apiClient.fetchBalance()
            async let transactionsRequest = apiClient.fetchTransactions()

            let (balance, transactions) = try await (
                balanceRequest,
                transactionsRequest
            )

            self.balance = balance
            self.transactions = transactions

            let statistics = await StatisticsCalculator.calculate(
                transactions: transactions
            )

            self.statistics = statistics

        } catch {

            errorMessage = error.localizedDescription
        }
    }
}
