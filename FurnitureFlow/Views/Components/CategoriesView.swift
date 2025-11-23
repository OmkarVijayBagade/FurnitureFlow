//
//  CategoriesView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//
import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            // category bar
            HStack {
                Text("Categories")
                    .font(.title.bold())

                Spacer()

                NavigationLink(destination:AllCategoriesView()) {
                    HStack(spacing: 4) {
                        Text("See All").foregroundColor(.gray)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.gray)
                    }
                }

            }
            .padding(.bottom, 14)

            // CATEGORY SCROLLER
            CategoryScrollView()
        }
    }
}

#Preview {
    CategoriesView()
}
