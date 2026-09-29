//
//  StatisticsCalculator.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import Foundation

enum StatisticsCalculator {

    @concurrent
    static func calculate(
        transactions: [Transaction]
    ) async -> Statistics {

        var totalIncome = 0.0
        var totalExpense = 0.0

        for transaction in transactions {

            if transaction.amount >= 0 {
                totalIncome += transaction.amount
            } else {
                totalExpense += abs(transaction.amount)
            }

            // Simulate expensive processing
            for _ in 0..<10_000 {
                _ = transaction.amount * 1.000001
            }
        }

        return Statistics(
            totalIncome: totalIncome,
            totalExpense: totalExpense,
            transactionCount: transactions.count
        )
    }
}
