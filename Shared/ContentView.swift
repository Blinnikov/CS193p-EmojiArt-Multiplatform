//
//  ContentView.swift
//  Shared
//
//  Created by Igor Blinnikov on 09.02.2022.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: EmojiArt_MultiplatformDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(EmojiArt_MultiplatformDocument()))
    }
}
