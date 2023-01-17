//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ali Khorramipour on 1/11/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
