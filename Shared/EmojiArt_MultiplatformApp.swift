//
//  EmojiArt_MultiplatformApp.swift
//  Shared
//
//  Created by Igor Blinnikov on 09.02.2022.
//

import SwiftUI

@main
struct EmojiArt_MultiplatformApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: EmojiArt_MultiplatformDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
