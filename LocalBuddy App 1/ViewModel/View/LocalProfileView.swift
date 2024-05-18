//
//  LocalProfileView.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//
import SwiftUI

struct LocalProfileView: View {
    let user: User
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Image("local1")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330, height: 210.0)
                        .clipped()
                        .cornerRadius(8)
                        .offset(x: 0.0, y: -28.0)
                    
                    
                    // Name and Rating
                    Text(user.name)
                      .font(.title2)
                        .fontWeight(.bold)
                        .offset(x: 5.0, y: 10.0)
                    
                   ZStack {
                       RoundedRectangle(cornerRadius: 10)
                           .foregroundColor(.white)
                           .frame(width: 70, height: 22)
                           .overlay(
                               RoundedRectangle(cornerRadius: 10)
                                   .stroke(Color.gray, lineWidth: 1)
                           )
                       
                       HStack {
                           Text("(\(user.reviews.count))")
                               .font(.system(size: 10))
                               .foregroundColor(.gray)
                           
                           Image(systemName: "star.fill")
                               .foregroundColor(Color("mustard"))
                               .frame(width: 15, height: 15)
                           
                           Text(String(format: "%.1f", user.rating))
                               .font(.system(size: 10))
                               .foregroundColor(.black)
                               .bold()
                       }
                   }
                   .offset(x: 113, y: /*@START_MENU_TOKEN@*/-83.0/*@END_MENU_TOKEN@*/)

                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(Color("mustard"))
                        Text(user.language)
                    }.offset(x: /*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-20.0/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    
                    Text(user.description)
                        .multilineTextAlignment(.center)
                        .offset(x: /*@START_MENU_TOKEN@*/9.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-10.0/*@END_MENU_TOKEN@*/)
                    
                }
                .padding()
                .frame(width: 330,height: 500)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray4, lineWidth: 1)
                )
                
                // Reviews
                Text("Tourist commments")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 18.0)
                    .offset(x: -81.0, y: 15.0)
                
                ForEach(user.reviews) { review in
                    VStack(alignment: .leading) {
                        HStack {
                            Image("circleimage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .background(Color("mustard"))
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(review.username)
                                    .font(.headline)
                                Text(review.date)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        Text(review.comment)
                            .padding(.vertical)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .frame(width: 320, height: 200)
                    .padding(.horizontal)
                }
                
                NavigationLink(destination: PostReviewView()) {
                    Text("Post Review")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ChatView()) {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct LocalProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LocalProfileView(user: sampleUser)
    }
}
