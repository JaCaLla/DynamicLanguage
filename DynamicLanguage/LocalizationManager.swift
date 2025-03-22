//
//  LocalizationManager.swift
//  DynLan
//
//  Created by Javier Calatrava on 21/3/25.
//

import Foundation
import SwiftUI

class LocalizationManager: ObservableObject {
    @Published var locale: Locale = .current {
        didSet {
            UserDefaults.standard.set([locale.identifier], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
    
    init() {
        if let preferredLanguage = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String {
            locale = Locale(identifier: preferredLanguage)
        }
    }
    
    func toggleLanguage() {
        if locale.identifier == "en" {
            locale = Locale(identifier: "es")
        } else {
            locale = Locale(identifier: "en")
        }
    }
}
