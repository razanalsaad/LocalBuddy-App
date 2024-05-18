//
//  UsersViewModel.swift
//  LocalBuddy App 1
//
//  Created by razan on 07/05/2024.
//
import SwiftUI
import CloudKit
import AuthenticationServices


class UserViewModel: NSObject,ObservableObject, ASAuthorizationControllerDelegate {
   @Published var LBUsers: [LBUsers] = []
   @Published var categoryId = ""
   @Published var firstName = ""
   @Published var lastName = ""
   @Published var birthdate = Date()
   @Published var email = ""
   @Published var password = ""
   @Published var languageSpoken: [String] = []
   @Published var aboutMe = ""
   @Published var rating: Double = 5.0
   
   @Published var isUserAuthenticated = false
   
   @Published var gender: Gender = .male
   enum Gender {
      case male
      case female
   }
   
   func signInWithAppleID() {
           let provider = ASAuthorizationAppleIDProvider()
           let request = provider.createRequest()
           request.requestedScopes = [.fullName, .email]
           
           let authorizationController = ASAuthorizationController(authorizationRequests: [request])
           authorizationController.delegate = self
           authorizationController.performRequests()
       }
   
   func fetchLBUsers() {
           guard isUserAuthenticated else { return }
           
      
      
           let predicate = NSPredicate(value: true)
           let query = CKQuery(recordType: "LBUsers", predicate: predicate)
           
           let operation = CKQueryOperation(query: query)
           operation.recordFetchedBlock = { record in
               DispatchQueue.main.async {
                
                  let user = LocalBuddy_.LBUsers(record: record)
                   self.LBUsers.append(user)
               }
           }
           
           let container = CKContainer.default()
           let database = container.publicCloudDatabase
           database.add(operation)
       }
   }

  
    
func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
   print("Authorization failed: \(error.localizedDescription)")
   
   
   
   
   func SaveLBUsersToCloudKit(LBUsers: LBUsers, completion: @escaping (Error?) -> Void) {
      let record = CKRecord(recordType: "LBUsers")
      record["firstName"] = LBUsers.firstName
      record["lastName"] = LBUsers.lastName
      record["email"] = LBUsers.email
      record["password"] = LBUsers.password
      record["languageSpoken"] = LBUsers.languageSpoken
      record["aboutMe"] = LBUsers.aboutMe
      record["rating"] = LBUsers.rating
      
      let container = CKContainer.default()
      let publicDatabase = container.publicCloudDatabase
      
      publicDatabase.save(record) { (savedRecord, error) in
         completion(error)
      }
   }
}

func addUserToCloudKit( firstName: String, lastName: String ,email: String ,password: String ,languageSpoken: String ,aboutMe: String ,rating: Double) async throws -> CKRecord {
   let record = CKRecord(recordType: "LBUsers")
  

      
      record["firstName"] = firstName
      record["lastName"] = lastName
      record["email"] = email
      record["password"] = password
      record["languageSpoken"] = languageSpoken
      record["aboutMe"] = aboutMe
      record["rating"] = rating
   
      
      // Save the record to CloudKit
      let savedRecord = try await CKContainer(identifier: "").publicCloudDatabase.save(record)
   
   return savedRecord
}

