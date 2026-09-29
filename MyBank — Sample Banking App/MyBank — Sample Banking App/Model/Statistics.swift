//
//  Statistics.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//

import Foundation

struct Statistics: Sendable {

    let totalIncome: Double
    let totalExpense: Double
    let transactionCount: Int

    var balanceChange: Double {
        totalIncome - totalExpense
    }
}
