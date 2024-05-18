//
//
//  JoinActivity.swift
//  LocalBuddy
//
//  Created by Ghadah Albassam on 15/05/2024.
//

import SwiftUI

struct JoinActivity: View {
    @State private var showAlert = false
    
    var body: some View {
       
            ScrollView {
                VStack(spacing: 20) {
                    // Image Section
                    Image("camping")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .clipped()
                        .cornerRadius(10)
                        .offset(x: 10.0, y: -59.0)
                    
                    // Title Section
                    Text("Camping (Kashta)")
                      .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                        .offset(x: -30.0, y: -47.0)
                    
                    // Description Section
                    Text("Enjoy an experience with \nlocals in the desert and have \na wonderful time.")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .offset(x: -17.0, y: -41.0)
                    
                    // Activity Host Section
                    HStack {
                        Image("circleimage1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 72, height: 69)
                           
                            
                        
                        Text("Activity with Haifa")
                            .fontWeight(.bold)
                    }
                    .offset(x: -40.0, y: -35.0)
                    
                    // Information Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "mappin")
                                .foregroundColor(Color("mustard"))
                                .font(.system(size: 20))
                            
                            Text("Riyadh, Saudi Arabia")
                                .font(.system(size: 15))
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("mustard"))
                                .font(.system(size: 20))
                            
                            Text("8 May 2024")
                                .font(.system(size: 15))
                        }
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(Color("mustard"))
                                .font(.system(size: 20))
                            
                            Text("4:00PM - 6:00PM")
                                .font(.system(size: 15))
                        }
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(Color("mustard"))
                                .font(.system(size: 20))
                            
                            Text("Spoken in: Arabic, English")
                                .font(.system(size: 15))
                        }
                    }
                    .padding(.horizontal, 20)
                    .offset(x: -45.0, y: -30.0)
                    
                    // Join Now Button Section
                    Button(action: {
                        showAlert = true
                    }) {
                        ZStack {
                            Rectangle()
                                .cornerRadius(15)
                                .foregroundColor(.black)
                                .frame(width: 300, height: 60)
                            
                           Text("Join Now")
                              .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Join Activity"),
                            message: Text("Are you sure you want to join this activity?"),
                            primaryButton: .default(Text("Yes")) {
                                // Action for "Yes" button
                            },
                            secondaryButton: .cancel(Text("No"))
                        )
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 16)
            }
         
        }
    }


#Preview {
    JoinActivity()
}
