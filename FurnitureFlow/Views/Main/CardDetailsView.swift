//
//  CardDetailsView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 23/11/25.
//

import SwiftUI

struct CardDetailsView: View {
    @State private var quantity: Int = 1
    let card: FurnitureCard
    init(card: FurnitureCard, initialQuantity: Int = 1) {
            self.card = card
            self._quantity = State(initialValue: initialQuantity)
        }
        
        var totalPrice: Int {
            quantity * card.price
        }
        

    var body: some View {
        VStack {
            ZStack {
                //Image and background
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 500)
                    .background(.black.opacity(0.85))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(radius: 20, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .frame(height: 370)
                            .foregroundStyle(.gray.opacity(0.35))
                            .shadow(color: .white, radius: 2, y: 2)
                            .offset(y: 330)
                    )
                //card title + star image + card.rating
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.title)
                            .font(.title.bold())
                            .foregroundStyle(.background)
                        Text(card.subTitle)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }
                    Spacer()

                    HStack {
                        Image(systemName: "star.fill")
                            .padding(10)
                            .background(.gray.opacity(0.7))
                            .clipShape(Circle())
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.2f", card.rating))
                            .font(.headline)
                            .foregroundStyle(.background)
                    }

                }
                .offset(y: 200)
                .padding(.horizontal, 20)

            }
            .offset(y: -20)

            //color + color circles + button increments
            HStack {

                VStack(alignment: .leading) {
                    Text("Color")
                        .font(Font.title.bold())
                        .foregroundStyle(Color.primary)

                    HStack(spacing: 20) {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 35, height: 35)

                        Circle()
                            .foregroundStyle(.brown)
                            .frame(width: 35, height: 35)

                        Circle()
                            .foregroundStyle(.black)
                            .frame(width: 35, height: 35)
                    }.offset(y: -20)
                }.offset(y:-30)

                Spacer()
                VStack(spacing: 12) {
                    Button(action: {
                        if quantity > 1 { quantity -= 1 }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .padding()

                    }

                    Text("\(quantity)")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Button {
                        quantity += 1
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding()
                    }

                }
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }.offset(y: -20).padding(.horizontal, 20)
            //description of the card
            Text(card.description)
                .font(Font.body)
                .frame(width: 280, height: 150)
                .lineLimit(10)
                .offset(x: -40, y: -80)
        }
        .padding(.horizontal, 40)

        //add to cart button
        NavigationLink(destination: AddToCartView(card: card, initialQuantity: quantity)) {
            HStack {
                Text("$\(card.price)")
                    .font(Font.title.bold())
                    .foregroundColor(.white)
                Spacer()
                Text("Add to Cart")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 400, height: 70)
            .background(Color.black.opacity(0.85))
            .clipShape(RoundedRectangle(cornerRadius: 35))
        }
        .padding(.horizontal)
        .offset(y: -50)

    }
}

#Preview {
    CardDetailsView(card: sampleCards[3])
}
