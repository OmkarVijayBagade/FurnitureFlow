//
//  TrendyListView.swift
//  FurnitureFlow
//
//  Created by Omkar Vijay Bagade on 22/11/25.
//

import SwiftUI

struct TrendyListView: View {
    let trendyCards: [FurnitureCard] = sampleCards.shuffled()
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Trending Now")
                .font(Font.title.bold())
                .padding(.horizontal)
                .padding(.top,20)
            ScrollView{
                LazyVStack(spacing:15){
                    ForEach(trendyCards){card in
                        NavigationLink(destination:CardDetailsView(card: card)){
                            HStack(spacing:20){
                                Image(card.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160,height:160)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(radius: 5)
                                    .offset(x:-20)
                                
                                VStack(alignment:.leading,spacing:6){
                                    Text(card.title)
                                        .font(Font.title2.bold())
                                        
                                    Text(card.subTitle)
                                        .font(Font.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    HStack{
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                        Text(String(format:"%.1f",card.rating))
                                            
                                    }.font(.subheadline)
                                    
                                    Text("$\(card.price)")
                                        .font(Font.headline.bold())
                                }
                            }
                            .frame(width:400)
                            .foregroundStyle(.black)
                            .background(.gray.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                }
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    TrendyListView()
}
