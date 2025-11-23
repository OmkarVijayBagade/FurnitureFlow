//
//  ContentView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("CozyRoom")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)

                VStack{
                    Text("Find your Perfect Furniture")
                        .font(.system(size:50, weight: .bold))
                        .fontDesign(.rounded)
                        .foregroundColor(.black.opacity(0.85))
                        .offset(x: -80, y: 80)
                        .frame(width:210)
                    
                    Spacer()
                    
                    NavigationLink{
                        HomeView()
                    }label:{
                        Text("Get Started")
                            .font(Font.largeTitle.bold())
                            .fontDesign(.rounded)
                            .foregroundStyle(.black.opacity(0.85))
                            .frame(width: 300)
                            .padding(.vertical,16)
                            .background(.white)
                            .clipShape(.buttonBorder)
                            .padding(.bottom, 30)
                    }
                }
                
            }
        }
    }
}

#Preview {
    OnboardingView()
}
