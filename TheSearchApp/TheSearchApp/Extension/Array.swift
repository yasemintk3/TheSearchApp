//
//  Array.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 22.05.2024.
//

import Foundation

extension Array {
  subscript(safe index: Index) -> Element? {
    0 <= index && index < count ? self[index] : nil
  }
}
