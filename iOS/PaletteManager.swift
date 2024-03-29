//
//  PaletteManager.swift
//  EmojiArt
//
//  Created by Igor Blinnikov on 24.01.2022.
//

import SwiftUI

struct PaletteManager: View {
  @EnvironmentObject var store: PaletteStore
//  @Environment(\.presentationMode) var presentationMode
  @Environment(\.isPresented) var isPresented
  @Environment(\.dismiss) var dismiss
  
  @State private var editMode: EditMode = .inactive
  
  var body: some View {
    NavigationView {
      List {
        ForEach(store.palettes) { palette in
          NavigationLink(destination: PaletteEditor(palette: $store.palettes[palette])) {
            VStack(alignment: .leading) {
              Text(palette.name)
              Text(palette.emojis)
            }
            .gesture(editMode == .active ? tap : nil)
          }
        }
        .onDelete { indexSet in
          store.palettes.remove(atOffsets: indexSet)
        }
        .onMove { indexSet, newOffset in
          store.palettes.move(fromOffsets: indexSet, toOffset: newOffset)
        }
      }
      .navigationTitle("Manage Palettes")
      .navigationBarTitleDisplayMode(.inline)
      .dismissable {
        //              presentationMode.wrappedValue.dismiss()
        dismiss()
      }
      .toolbar {
        ToolbarItem { EditButton() }
      }
      .environment(\.editMode, $editMode)
    }
  }
  
  var tap: some Gesture {
    TapGesture().onEnded {
      print("tap gesture in Edit mode")
    }
  }
}

struct PaletteManager_Previews: PreviewProvider {
  static var previews: some View {
    PaletteManager()
      .previewDevice("iPhone 8")
      .environmentObject(PaletteStore(named: "Preview"))
  }
}
