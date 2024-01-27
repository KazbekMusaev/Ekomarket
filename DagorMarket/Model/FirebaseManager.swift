//
//  FirebaseManager.swift
//  DagorMarket
//
//  Created by apple on 27.01.2024.
//

import Foundation
import Firebase
import FirebaseAuth

final class FirebaseManager {
    
    static let firebaseManager = FirebaseManager()
    
    private init() { }
    
    func createNewUser(email: String, password: String, complition: @escaping (Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { res, err in
            guard err == nil else {
                print(err!.localizedDescription)
                let locError = err as? NSError
                print(locError?.code ?? "Нет кода ошибки")
                complition(false)
                return
            }
            res?.user.sendEmailVerification()
            complition(true)
            
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    func signIn(email: String, password: String, complition: @escaping (Bool) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { res, err in
            guard err == nil else {
                print(err!.localizedDescription)
                let locError = err as? NSError
                print(locError?.code ?? "Нет кода ошибки")
                complition(false)
            return
            }
            complition(true)
            
        }
    }
    
    func checkAuth() -> Bool {
        guard let _ = Auth.auth().currentUser else { return false }
        return true
    }
    
}
