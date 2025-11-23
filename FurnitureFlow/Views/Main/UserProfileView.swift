//
//  ProfileView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct UserProfileView: View {
    @State private var profileImage: String = "person.crop.circle.fill"
    let user: User
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {

            // HEADER with custom shape
            GeometryReader { proxy in
                let w = proxy.size.width
                let h: CGFloat = 400

                ZStack {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.85))
                        .frame(height: h)
                        .clipShape(
                            Path { path in
                                path.move(to: .zero)
                                path.addLine(to: CGPoint(x: w, y: 0))
                                path.addLine(to: CGPoint(x: w, y: h * 0.75))
                                path.addLine(to: CGPoint(x: 0, y: h))
                                path.closeSubpath()
                            }
                        )
                        .overlay(
                            ZStack(alignment: .bottomTrailing) {
                                Image("profile")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(
                                            Color.white,
                                            lineWidth: 3
                                        )
                                    )

                                Circle()
                                    .fill(.black.opacity(0.85))
                                    .frame(width: 42, height: 42)
                                    .overlay(
                                        Image(systemName: "camera.fill")
                                            .font(
                                                .system(size: 18, weight: .bold)
                                            )
                                            .foregroundStyle(.white)
                                    )
                            }
                        )
                }
                .ignoresSafeArea(edges: .top)
            }
            .frame(height: 300)

            // USER NAME CARD
            VStack(alignment: .leading, spacing: 5) {
                Text(user.name)
                    .font(.largeTitle).bold()
                Text(user.email)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 2, y: 2)
            .padding(.horizontal)
            .offset(y:-40)

            // INFO LIST
            List {
                Text("Phone: \(user.phone)")
                Text("Address: \(user.address)")
                Text("City: \(user.city)")
                Text("Country: \(user.country)")
            }
            .scrollContentBackground(.hidden)
            .offset(y:-30)

            VStack {
                Button("Logout") {
                    dismiss()
                }.frame(maxWidth: 200)
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    UserProfileView(user: userSampleData[0])
}
