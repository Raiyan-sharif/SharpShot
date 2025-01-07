//
//  WrappedError.swift
//  SharpShot
//
//  Created by Raiyan Sharif on 7/1/25.
//

import SwiftUI

// Wrapper to make generic Error conform to Identifiable
struct WrappedError: Identifiable {
    let id = UUID() // Unique ID for Identifiable conformance
    let error: Error
}
