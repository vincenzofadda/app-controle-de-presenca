//
//  styles.swift
//  MultipleViews
//
//  Created by user on 26/05/23.
//

import Foundation
import SwiftUI

let purple = Color(
    .sRGB,
    red: Double(0x51) / 255,
       green: Double(0x1E) / 255,
       blue: Double(0xE4) / 255,
       opacity: 1
)

let blue = Color(
    .sRGB,
        red: Double(0x30) / 255,
        green: Double(0x62) / 255,
        blue: Double(0xF2) / 255,
        opacity: 1
)

let startGradient = Color(
    .sRGB,
        red: Double(0x5C) / 255,
        green: Double(0x22) / 255,
        blue: Double(0xD3) / 255,
        opacity: 1
)

let endGradient = Color(
    .sRGB,
        red: Double(0x30) / 255,
        green: Double(0x62) / 255,
        blue: Double(0xF2) / 255,
        opacity: 1
)

let blackWithOpacity = Color.black.opacity(0.25)

let gradient = LinearGradient(
    gradient: Gradient(colors: [startGradient, endGradient]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)
