//
//  DiabeatApp.swift
//  Diabeat
//
//  Created by Lyan Alwakeel on 08/11/2022.
//

import SwiftUI
import Firebase

@main
struct DiabeatApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(model: CRUDViewModel.getInstance(), classificationvm: ClassificationViewModel.getInstance())
        }
    }
}
