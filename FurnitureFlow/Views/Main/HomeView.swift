//
//  FurnitureFlowHomeView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {

                //topbar with profile image

                TopBarView()

                //Search text field
                SearchBarView()

                //Categories bar and horizontal scroll
                CategoriesView()

                //Trendy bar and card
                TrendyBarView()

                //Cards
                CardsScrollView()

                Spacer()
            }
            .fontDesign(.rounded)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeView()
}
