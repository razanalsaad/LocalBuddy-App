//
//  categoryIdModel.swift
//  LocalBuddy App 1
//
//  Created by razan on 12/05/2024.
//

import SwiftUI
import CloudKit

struct category {
    let recordID: CKRecord.ID?
    let text: String
    
    init(record: CKRecord) {
       
      self.recordID = record.recordID
      self.text = record["text"] as? String ?? "N/A"
    }
}
