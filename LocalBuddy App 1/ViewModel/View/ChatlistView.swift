//
//  ChatlistView.swift
//  LocalBuddy 
//
//  Created by Renad fahad Alfurayhi on 07/11/1445 AH.
//

import SwiftUI

struct ChatlistView: View {
    var body: some View {
        NavigationView {
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
                            Circle()
                                .fill(Color.mustard)
                                .frame(width: 70, height: 100)
                                .padding(.leading)
                            
                            // Message - Profile 1
                            VStack(alignment: .leading) {
                                Text("John Doe")
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
                            // Yellow circle - Profile 2
                            Circle()
                                .fill(Color.mustard)
                                .frame(width: 70, height: 100)
                                .padding(.leading)
                            
                            // Message - Profile 2
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ChatlistView()
}
