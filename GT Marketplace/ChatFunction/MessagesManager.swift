//
//  MessagesManager.swift
//  GT Marketplace
//
//  Created by Max Ko on 11/8/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

class MessagesManager: ObservableObject {
    
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents \(String(describing: error))")
                return
            }
            print(documents)
            self.messages = documents.compactMap { document -> Message? in
                do {
                    //print(try document.data(as: Message.self))
                    
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
                
            }
            self.messages = self.messages.sorted(by: {
                $0.timestamp.compare($1.timestamp) == .orderedAscending
            })
            
        }


    }

}
 
