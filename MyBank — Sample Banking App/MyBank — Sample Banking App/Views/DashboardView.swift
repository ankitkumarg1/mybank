//
//  ContentView.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import SwiftUI

struct DashboardView: View {

    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {

        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    balanceSection
                    statisticsSection
                    transactionsSection

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }

                    refreshButton
                }
                .padding()
            }
            .navigationTitle("MyBank")
        }
        .task {
            await viewModel.loadDashboard()
        }
    }
}

// MARK: - Sections
private extension DashboardView {

    var balanceSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Account Balance")
                .font(.headline)

            Text(
                viewModel.balance,
                format: .currency(code: "INR")
            )
            .font(.largeTitle)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.blue.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    var statisticsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Statistics")
                .font(.headline)

            if let statistics = viewModel.statistics {

                HStack {

                    statisticItem(
                        title: "Income",
                        value: statistics.totalIncome
                    )

                    statisticItem(
                        title: "Expense",
                        value: statistics.totalExpense
                    )
                }

                Text(
                    "Transactions: \(statistics.transactionCount)"
                )
                .font(.subheadline)
            } else {

                Text("Calculating statistics...")
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    func statisticItem(
        title: String,
        value: Double
    ) -> some View {

        VStack(alignment: .leading) {

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(
                value,
                format: .currency(code: "INR")
            )
            .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var transactionsSection: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("Recent Transactions")
                .font(.headline)

            ForEach(viewModel.transactions) { transaction in

                TransactionRowView(
                    transaction: transaction
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var refreshButton: some View {

        Button {

            Task {
                await viewModel.loadDashboard()
            }

        } label: {

            if viewModel.isLoading {

                ProgressView()

            } else {

                Text("Refresh Dashboard")
                    .frame(maxWidth: .infinity)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}
