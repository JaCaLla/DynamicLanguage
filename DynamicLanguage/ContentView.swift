//
//  ContentView.swift
//  DynamicLanguage
//
//  Created by Javier Calatrava on 22/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var localizationManager = LocalizationManager()
    
    var body: some View {
        VStack {
            Text("welcome_message".localized(with: localizationManager.locale))
                .padding()
            
            Button(action: {
                localizationManager.toggleLanguage()
            }) {
                Text("change_language".localized(with: localizationManager.locale))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .environmentObject(localizationManager)
    }
}

extension String {
    func localized(with locale: Locale) -> String {
        let language = locale.identifier
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return NSLocalizedString(self, comment: "")
        }
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}

#Preview {
    ContentView()
}
