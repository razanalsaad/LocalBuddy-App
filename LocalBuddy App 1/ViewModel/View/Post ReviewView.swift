//
//  Post ReviewView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI

struct PostReviewView: View {
    @State private var comment: String = ""
    @State private var rating: Int = 2

    var body: some View {
    
            VStack {
          
                HStack(alignment: .top) {
                   Image("circleimage")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 72, height: 69)
                       
                       
                    
                    VStack(alignment: .leading) {
                        TextField("Add Comment", text: $comment)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        HStack {
                            ForEach(1..<6) { index in
                                Image(systemName: index <= rating ? "star.fill" : "star")
                                    .foregroundColor(index <= rating ? .yellow : .gray)
                                    .onTapGesture {
                                        rating = index
                                    }
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding(.leading, 5)
                }
                
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray4.opacity(0.5), lineWidth: 1)
                )
                .padding([.top, .leading, .trailing], 24.0)
                
                Button(action: {
                    // Action for the Post Review button
                }) {
                   Text("Post Review")
                      .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding([.top, .leading, .trailing], 17.0)
                
                Spacer()
            }
//            .navigationBarTitle("Post Review view", displayMode: .inline)
//            .navigationBarHidden(true)
        }
    }


struct PostReviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostReviewView()
    }
}
