//
//  CardsScrollView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct CardsScrollView: View {
    @State private var cards: [FurnitureCard] = sampleCards

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach($cards) { $card in
                    NavigationLink(destination:CardDetailsView(card: card)) {
                        CardsView(card: $card)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct CardsView: View {
    @Binding var card: FurnitureCard

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 350)
                    .foregroundColor(.primary.opacity(0.85))

                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 300)
                    .offset(y: -30)

                Button(action: {
                    card.isLiked.toggle()
                }) {
                    Image(systemName: card.isLiked ? "heart.fill" : "heart")
                        .foregroundStyle(.black)
                        .padding(10)
                        .background(.white)
                        .clipShape(Circle())
                }
                .padding(12)
                .offset(x: 110, y: -135)

                VStack(alignment: .leading) {
                    Text(card.title)
                        .font(.headline)
                    HStack {
                        Text("$\(card.price)")
                            .font(Font.title3.bold())
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f", card.rating))
                            .font(.subheadline)
                    }
                    .frame(width: 250)
                }
                .padding(.horizontal, 10)
                .offset(y: 130)
                .foregroundStyle(.white)

            }

        }
    }
}

#Preview {
    CardsScrollView()
}
