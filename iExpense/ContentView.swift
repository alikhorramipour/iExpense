//
//  ContentView.swift
//  iExpense
//
//  Created by Ali Khorramipour on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.id) { item in
                    if item.type == "Business" {
                        Section("Business"){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                if item.amount > 100.0 {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .font(.largeTitle)
                                } else if item.amount > 10.0 {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .font(.headline)
                                } else {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                }
                            }
                        }
                    } else {
                        Section("Personal"){
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                if item.amount > 100.0 {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .font(.largeTitle)
                                } else if item.amount > 10.0 {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .font(.headline)
                                } else {
                                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                }
                        }
                    }
                    
                        
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
