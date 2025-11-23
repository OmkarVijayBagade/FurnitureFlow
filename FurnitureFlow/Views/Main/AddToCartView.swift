//
//  AddToCartView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 23/11/25.
//

import SwiftUI

struct AddToCartView: View {
    let card: FurnitureCard
    @State private var quantity: Int
    
    init(card: FurnitureCard, initialQuantity: Int = 1) {
        self.card = card
        self._quantity = State(initialValue: initialQuantity)
    }
    
    var totalPrice: Int {
        quantity * card.price
    }
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Spacer()
                Text("My Cart")
                    .font(.largeTitle.bold())
                Spacer()
                
                NavigationLink(destination: PaymentView(totalAmount: totalPrice)) {
                    Image(systemName: "cart")
                        .font(.largeTitle)
                        .foregroundStyle(.black.opacity(0.85))
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            // PRODUCT ROW
            HStack(spacing: 20) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(card.title)
                        .font(.title3.bold())
                    
                    Text(card.subTitle)
                        .foregroundStyle(.secondary)
                    
                    // Quantity Adjuster
                    HStack {
                        Button {
                            if quantity > 1 { quantity -= 1 }
                        } label: {
                            Image(systemName: "minus")
                                .padding(8)
                                .foregroundStyle(.black)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                        
                        Text("\(quantity)")
                            .font(.title3.bold())
                            .frame(minWidth: 40)
                        
                        Button {
                            quantity += 1
                        } label: {
                            Image(systemName: "plus")
                                .padding(8)
                                .foregroundStyle(.black)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
            
            // TOTAL & BUTTON
            VStack(spacing: 15) {
                HStack {
                    Text("Total:")
                        .font(.title2.bold())
                    Spacer()
                    Text("$\(totalPrice)")
                        .font(.title2.bold())
                }
                .padding(.horizontal)
                
                NavigationLink(destination: PaymentView(totalAmount: totalPrice)) {
                    Text("Proceed to Payment")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.85))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal)
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    AddToCartView(card: sampleCards[0])
    
}
