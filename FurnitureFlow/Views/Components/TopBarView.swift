//
//  TopBarView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Find your")
                Text("dream furniture")
            }
            .font(Font.largeTitle.bold())

            Spacer()

            NavigationLink(destination: UserProfileView(user: userSampleData[0])) {
                Image("profile")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                    .overlay(
                        Circle()
                            .stroke(Color.primary, lineWidth: 3)
                            .frame(width: 85, height: 85)
                            .opacity(0.85)
                    ).padding(.trailing,20)
            }

        }
        .padding(.top, 20)
    }
}

#Preview {
    TopBarView()
}
