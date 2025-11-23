//
//  SearchBarView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText: String = ""
    @State private var showFilterSheet = false

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.horizontal, 20)

            TextField("Search...", text: $searchText)
                .font(.system(size: 30))

            Button {
                //filter sheet
                showFilterSheet = true
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .foregroundStyle(Color.black)
                    .frame(width: 30, height: 25)
                    .padding(.horizontal, 20)
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterSheetView()
                    .background(Color.white)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
        .frame(height: 80)
        .background(Color.gray.opacity(0.1))
        .clipShape(.buttonBorder)
        .shadow(color: Color.black.opacity(0.05), radius: 6, y: 3)

    }
}
private struct FilterSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedFilter: String = "All"

    let filters = [
        "All", "Sofa", "Table", "Chair", "Dining Table",
    ]

    var body: some View {
        NavigationView{
            List{
                ForEach(filters, id:\.self) {filter in
                    HStack{
                        Text(filter)
                        Spacer()
                        if filter == selectedFilter {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedFilter = filter
                        
                    }
                }
            }
            .navigationTitle("Filters")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Done"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SearchBarView()
}
