//
//  ExploreView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//
//
//  Created by Ghadah Albassam on 06/05/2024.
//
import SwiftUI

struct ExploreView: View {
    @State private var navigateToJoinActivity = false
    @State private var navigateToLocalProfile = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Activities for you ⛺️")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .offset(x: 32.0, y: 15.0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(1...4, id: \.self) { index in
                            ZStack(alignment: .top) {
                                Rectangle()
                                    .frame(width: 280, height: 380)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                
                                VStack {
                                    Image("camping")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 280, height: 170)
                                        .clipped()
                                        .cornerRadius(10)
                                    
                                    Image("circleimage1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 71, height: 69)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 100)
                                                            .stroke(Color.white, lineWidth: 6)
                                                .offset(x: 1.0, y: -1.0)
                                        )
                                        .offset(x: 81, y: -34)
                                    
                                    Text("Camping (Kashta)")
                                      .font(.headline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)
                                        .offset(x: -41.0, y: -54.0)
                                    
                                    Text("Enjoy experience with locals in \nDesert and have a wonderful time")
                                        .font(.callout)
                                        .multilineTextAlignment(.leading)
                                        .offset(x: 8.0, y: -41.0)
                                    
                                    HStack {
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color("mustard"))
                                            .font(.system(size: 14))
                                        
                                        Text("May 8th, 2024")
                                            .font(.system(size: 14))
                                            .bold()
                                    }
                                    .offset(x: -55.0, y: -28.0)
                                    
                                    Button(action: {
                                        navigateToJoinActivity = true
                                    }) {
                                        ZStack {
                                            Rectangle()
                                                .cornerRadius(10)
                                                .foregroundColor(.black)
                                                .frame(width: 150, height: 40)
                                            
                                           Text("Join Now")
                                              .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                                .bold()
                                        }
                                    }
                                    .offset(x: 6.0, y: -24.0)
                                    .background(
                                        NavigationLink(
                                            destination: JoinActivity(),
                                            isActive: $navigateToJoinActivity,
                                            label: {
                                                EmptyView()
                                            }
                                        )
                                    )
                                }
                            }
                            .padding(10)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                VStack {
                    Text("Top Locals 🎩")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .offset(x: -87.0, y: 3.0)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) { // Adjust spacing to avoid overlap
                            ForEach(1...4, id: \.self) { index in
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 220, height: 320)
                                        .cornerRadius(10)
                                        .shadow(radius: 2)
                                        .offset(x: 9.0, y: -68.0)
                                    
                                    VStack {
                                        Image("local1")
                                            .renderingMode(.original)
                                            .resizable(resizingMode: .stretch)
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 222.0, height: 130.0)
                                            .clipped()
                                            .cornerRadius(10)
                                            .offset(x: 8.0, y: -57.0)
                                        
                                        HStack {
                                            Text("Faisal Ahmed")
                                                .font(.system(size: 18))
                                                .fontWeight(.bold)
                                                .offset(x: 9.0, y: -67.0)
                                            
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 70, height: 22)
                                                    .cornerRadius(10)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                                
                                                HStack {
                                                    Text("(2)")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.gray)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color("mustard"))
                                                        .frame(width: 15, height: 15)
                                                    
                                                    Text("4.3")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.black)
                                                        .bold()
                                                }
                                            }
                                            .padding(10)
                                            .offset(x: 15.0, y: -65.0)
                                        }
                                        
                                        Button(action: {
                                            navigateToLocalProfile = true
                                        }) {
                                            ZStack {
                                                Rectangle()
                                                    .cornerRadius(10)
                                                    .foregroundColor(.black)
                                                    .frame(width: 150, height: 40)
                                                
                                               Text("View Profile")
                                                  .fontWeight(.semibold)
                                                  .font(.system(size: 15))                 .foregroundColor(.white)
                                                    .font(.system(size: 16))
                                                    .bold()
                                            }
                                        }
                                        .offset(x: 11.0, y: -51.0)
                                        .background(
                                            NavigationLink(
                                                destination: LocalProfileView(user: sampleUser),
                                                isActive: $navigateToLocalProfile,
                                                label: {
                                                    EmptyView()
                                                }
                                            )
                                        )
                                    }
                                }
                                .accentColor(.black)
                                .padding(10)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ExploreView()
}

