//
//  TransactionRowView.swift
//  MyBank — Sample Banking App
//
//  Created by Ankit on 28/09/26.
//
import SwiftUI

struct TransactionRowView: View {

    let transaction: Transaction

    var body: some View {

        HStack(spacing: 12) {

            Image(systemName: iconName)
                .frame(width: 30)

            VStack(alignment: .leading) {

                Text(transaction.title)
                    .font(.body)

                Text(transaction.category.rawValue.capitalized)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(
                transaction.amount,
                format: .currency(code: "INR")
            )
            .fontWeight(.semibold)
        }
        .padding(.vertical, 6)
    }

    private var iconName: String {

        switch transaction.category {

        case .food:
            return "fork.knife"

        case .shopping:
            return "bag"

        case .travel:
            return "airplane"

        case .bills:
            return "doc.text"

        case .salary:
            return "banknote"

        case .other:
            return "ellipsis.circle"
        }
    }
}
