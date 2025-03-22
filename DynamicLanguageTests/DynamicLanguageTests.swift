//
//  DynamicLanguageTests.swift
//  DynamicLanguageTests
//
//  Created by Javier Calatrava on 22/3/25.
//

import Testing
@testable import DynamicLanguage
import SnapshotTesting
import SwiftUI

@MainActor
@Suite("Snapshot tests")
struct DynamicLanguageTests {

    let record = true

    @Test func testContentViewInEnglish() {
            let localizationManager = LocalizationManager()
            localizationManager.locale = Locale(identifier: "en")
            
            let contentView = ContentView()
                .environmentObject(localizationManager)
                .frame(width: 300, height: 200)
            
            let viewController = UIHostingController(rootView: contentView)
            
            assertSnapshot(
                of: viewController,
                as: .image(on: .iPhoneSe),
                named: "ContentView-English",
                record: record
            )
        }

    @Test  func testContentViewInSpanish() {
            let localizationManager = LocalizationManager()
            localizationManager.locale = Locale(identifier: "es")
            
            let contentView = ContentView()
                .environmentObject(localizationManager)
                .frame(width: 300, height: 200)
            
            let viewController = UIHostingController(rootView: contentView)
            
            assertSnapshot(
                of: viewController,
                as: .image(on: .iPhoneSe),
                named: "ContentView-Spanish",
                record: record
            )
        }
}
