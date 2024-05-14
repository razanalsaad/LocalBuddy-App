//
//  ExploreView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

//
//  explore.swift
//  macro
//
//  Created by Ghadah Albassam on 06/05/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Activities for you ⛺️")
                .bold()
                .padding(.horizontal, 40.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:-10) {
                    ForEach(1...4, id: \.self) { index in
                        ZStack(alignment: .top) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 300, height: 340)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            
                            Image("camping")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 170)
                                .clipped()
                                .cornerRadius(10)
                                .alignmentGuide(.top) { _ in 0 }
                            
                            Image("circleimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55)
                                .position(x: 50, y: 160)
                            
                            Text("Camping (Kashta)")
                                .position(x: 80, y: 200)
                                .bold()
                            
                            Text("Enjoy experience with locals in the\nDesert and have a wonderful time")
                               .multilineTextAlignment(.center)
                               .lineLimit(2)
                                .position(x: 140, y: 235)
                            
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(Color("mustard"))
                                    .font(.system(size: 14))
                                
                                Text("May 8th, 2024")
                                    .font(.system(size: 14))
                                    .bold()
                            }
                            .position(x: 80, y: 270)
                            
                            ZStack {
                                Rectangle()
                                    .cornerRadius(15)
                                    .foregroundColor(.black)
                                    .frame(width: 100, height: 40)
                                
                                Text("Join Now +")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .position(x: 155, y: 310)
                        }
                        .padding(.horizontal, 24)
                    }
                }
                .padding()
            }
            VStack(alignment: .leading) {
                Text("Top Locals 🎩")
                    .bold()
                    .padding(.horizontal, 40.0)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -10) {
                    ForEach(1...4, id: \.self) { _ in
                        ZStack(alignment: .top) {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 220, height: 220)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            
                            Image("local1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 220, height: 120)
                                .clipped()
                                .cornerRadius(10)
                                .alignmentGuide(.top) { _ in 0 }
                            
                            HStack {
                                Text("Faisal")
                                    .font(.system(size: 20))
                                    .position(x: 40, y: 140)
                                    .bold()
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 90, height: 20)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray1, lineWidth: 1)
                                        )
                                    
                                    HStack {
                                        Text("(230)")
                                            .font(.system(size: 9))
                                            .foregroundColor(.gray1)
                                        
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color("mustard"))
                                            .frame(width: 20, height: 20)
                                        
                                        Text("4.3")
                                            .font(.system(size: 10))
                                            .foregroundColor(.black)
                                            .bold()
                                    }
                                    
                                }
                                .position(x: 55, y: 140)
                                
                            }
                            Text("About Me")
                                .font(.system(size: 15))
                                .position(x: 50, y: 160)
                                .bold()
                            
                            Text("Sociable local with a love\nfor cooking, food, and socializing.")
                                .font(.system(size: 12))
                                //.multilineTextAlignment(.center)
                                .position(x: 110, y: 190)
                        }
                    }.padding(20)
                }
                .padding(.horizontal, 24)
            }
            
        }
}
}
  

#Preview {
    ExploreView()
}
