//
//  CreateActivityView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI

struct CreateActivityView: View {
    @EnvironmentObject var viewModel: ActivityViewModel
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.mustard)
                        .frame(width: 342, height: 160)
                        .cornerRadius(10)
                        .position(CGPoint(x: 200, y: 110 ))
                    
                    Text("Share your interests, plan activities, and connect with others who share your \n passion for unforgettable experiences")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.body)
                        .position(CGPoint(x: 200, y:80 ))
                    
                   
                    NavigationLink(destination: ActivityForm()) {
                                            ZStack {
                                Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 208, height: 52)
                                .cornerRadius(10)
                                                
                                Text("Create Activity +")
                                .foregroundColor(.white)
                                                    .bold()
                                            }
                                            .position(CGPoint(x: 200, y:150 ))
                                        }
                                    }
                                }
                                .navigationBarItems(trailing:
                                    HStack {
                                        Image(systemName: "bell.badge")
                                    }
                                )
                            }
                        }
                    }


#Preview {
    CreateActivityView()
        .environmentObject(ActivityViewModel())
}
