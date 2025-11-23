//
//  CategoryScrollView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct CategoryScrollView: View {
    @State private var selectedCategory: String = "Accessories"

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(categories, id: \.name) { category in

                    let isSelected = (selectedCategory == category.name)

                    Button {
                        selectedCategory = category.name
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.icon)
                                .font(.system(size: 22, weight: .regular))
                                .foregroundColor(
                                    isSelected ? .white : .black
                                )

                            Text(category.name)
                                .font(.system(size: 13))
                                .foregroundColor(
                                    isSelected ? .white : .gray
                                )
                        }
                        .frame(width: 90, height: 120)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 30,
                                style: .continuous
                            )
                            .fill(
                                isSelected
                                ? Color.black.opacity(0.85) : Color(.systemGray6)
                            )
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(height: 130)
        }
    }
}

#Preview {
    CategoryScrollView()
}
