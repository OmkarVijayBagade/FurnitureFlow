//
//  TrendyBarView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct TrendyBarView: View {
    var body: some View {
        HStack(spacing:4) {
            Text("Trendy")
                .font(Font.title.bold())
            
            Spacer()
            
            NavigationLink(destination: TrendyListView()) {
                HStack {
                    Text("See All")
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.gray)
            }
        }    }
}

#Preview {
    TrendyBarView()
}
