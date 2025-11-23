//
//  PaymentView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 23/11/25.
//

import SwiftUI

struct PaymentView: View {
//    @Environment(\.dismiss) private var dismiss
    let totalAmount: Int

    var body: some View {
        VStack(spacing: 40) {
            Text("Payment")
                .font(.largeTitle.bold())
                .padding(.top, 50)
            Text("Total: $\(totalAmount)")
                .font(.largeTitle.bold())
                .padding(.top, 50)
            Spacer()

            //Pay Now button
            Button(action: {
                // Payment logic placeholder
                print("Paying $\(totalAmount)")
//                dismiss()
            }) {
                Text("Pay Now")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(Color.black.opacity(0.85))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
        .fontDesign(.rounded)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PaymentView(totalAmount: sampleCards[0].price * 2)
}
