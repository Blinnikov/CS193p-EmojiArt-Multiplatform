//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Igor Blinnikov on 12.01.2022.
//

import Foundation

struct EmojiArtModel: Codable {
  var background = Background.blank
  var emojis = [Emoji]()
  
  struct Emoji: Identifiable, Hashable, Codable {
    let text: String
    var x: Int // offset from the center
    var y: Int // offset from the center
    var size: Int
    let id: Int
    
    fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
      self.text = text
      self.x = x
      self.y = y
      self.size = size
      self.id = id
    }
  }
  
  func json() throws -> Data {
    return try JSONEncoder().encode(self)
  }
  
  init() { }
  
  init(json: Data) throws {
    self = try JSONDecoder().decode(EmojiArtModel.self, from: json)
  }
  
  init(url: URL) throws {
    let data = try Data(contentsOf: url)
    try self.init(json: data)
    // Is also possible
    // self = try EmojiArtModel(json: data)
  }
  
  private var uniqueEmojiId = 0
  
  mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
    uniqueEmojiId += 1
    emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
  }
  
  mutating func removeEmoji(_ emojiToRemove: Emoji) {
    if let index = emojis.firstIndex(where: { emoji in emoji.id == emojiToRemove.id }) {
      emojis.remove(at: index)
    }
  }
}
