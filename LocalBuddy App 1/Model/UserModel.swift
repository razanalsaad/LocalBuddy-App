//
//  UserModel.swift
//  LocalBuddy App 1
//
//  Created by razan on 30/04/2024.
//
import SwiftUI
import CloudKit

struct LBUsers: Identifiable {
   let recordId: CKRecord.ID?
   var category: CKRecord.Reference
   var firstName: String
   var lastName: String
   var email: String
   var password: String
   var languageSpoken: String
   var aboutMe: String
   var rating: Double
   var isLocal: Bool
   var id = CKRecord.ID(recordName:"")
   
   
   
   init(record: CKRecord) {
      self.recordId = record.recordID
      self.category = record["category"] as? CKRecord.Reference ?? CKRecord.Reference(recordID: CKRecord.ID(recordName: "category"), action: .none)
      self.firstName = record["firstName"] as? String ?? "N/A"
      self.lastName = record["lastName"] as? String ?? "N/A"
      self.email = record["email"] as? String ?? "N/A"
      self.password = record["password"] as? String ?? "N/A"
      self.languageSpoken = record["languageSpoken"] as? String ?? "N/A"
      self.aboutMe = record["aboutMe"] as? String ?? "N/A"
      self.rating = record["rating"] as? Double ?? 0
      self.isLocal = true
   }
}
let record = CKRecord(recordType: "LBUsers")
let user = LBUsers(record: record)



struct User {
    let name: String
    let rating: Double
    let description: String
    let language: String
    let reviews: [Review]
}

struct Review: Identifiable {
    let id = UUID()
    let username: String
    let comment: String
    let date: String
}
let sampleReviews: [Review] = [
    Review(username: "Emily", comment: "Thank you Faisal for your great welcoming I Enjoyed a lot 🥰", date: "1 month ago"),
    Review(username: "John", comment: "Great experience! Faisal was a fantastic host.", date: "2 months ago")
]

let sampleUser: User = User(
    name: "Faisal Ahmed",
    rating: 4.2,
    description: "A sociable local with a love for cooking, food, and socializing. They bring people together through delightful culinary experiences, sharing their expertise and insider knowledge of local food culture.",
    language: "English",
    reviews: sampleReviews
)
