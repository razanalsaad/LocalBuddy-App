//
//   ChatlistView.swift
//  LocalBuddy
//
//  Created by razan on 16/05/2024.
//

import SwiftUI

struct ChatlistView: View {
    var body: some View {
       
        let text1Color = Color.mustard
        let text2Color = Color.gray
            VStack {
                Text("Chat")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(spacing: 20) {
                            // Yellow circle - Profile 1
                            Image("circleimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 100)
                                .padding(.leading)
                            
                            // Message - Profile 1
                            VStack(alignment: .leading) {
                                Text("Emily Smith")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    
                                Text("You :")
                                           .foregroundColor(text1Color)
                                           .font(.body)
                                           
                                           Text("OK")
                                           .foregroundColor(text2Color)
                                           .font(.body)

                                           .font(.body)
                                           
                            }
                            
                            Spacer()
                            
                            // Timestamp - Profile 1
                            Text("10:30 AM")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                        
                        Divider() // Gray line separating chat items
                        HStack(spacing: 20) {
                            
                            Image("circleimage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 100)
                                .padding(.leading)
                            
                            
                            VStack(alignment: .leading) {
                                Text("Jane Smith")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("You :")
                                           .foregroundColor(text1Color)
                                           .font(.body)
                                  
                                Text("How are you?")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            // Timestamp - Profile 2
                            Text("12:45 PM")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                    }
                    Divider() // Gray line separating chat items
                    .padding()
                }
                Spacer()
            }
          
        }
    }


#Preview {
    ChatlistView()
}
