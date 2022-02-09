//
//  EmojiArt_MultiplatformApp.swift
//  Shared
//
//  Created by Igor Blinnikov on 09.02.2022.
//

import SwiftUI

@main
struct EmojiArtApp: App {
  @StateObject var paletteStore = PaletteStore(named: "Default")
  
  var body: some Scene {
    DocumentGroup(newDocument: { EmojiArtDocument() }) { config in
      EmojiArtDocumentView(document: config.document)
        .environmentObject(paletteStore)
    }
  }
}
