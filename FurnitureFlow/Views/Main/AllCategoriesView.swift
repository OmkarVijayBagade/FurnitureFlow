//
//  AllCategoriesView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct AllCategoriesView: View {
    var body: some View {
        VStack {
            Text("All Categories")
                .font(Font.largeTitle.bold())
                .padding(.horizontal)
                .padding(.top, 20)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(categories, id: \.name) { category in
                        HStack(spacing: 20) {
                            Image(systemName: category.icon)
                                .font(.system(size: 25))
                                .frame(width: 50, height: 50)
                                .background(.gray.opacity(0.3))
                                .clipShape(Circle())

                            Text(category.name)
                                .font(.title2.bold())

                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(
                            color: Color.black.opacity(0.05),
                            radius: 3,
                            y: 2
                        )
                        .padding(.horizontal, 10)
                    }
                }.padding(.top,10)
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    AllCategoriesView()
}
