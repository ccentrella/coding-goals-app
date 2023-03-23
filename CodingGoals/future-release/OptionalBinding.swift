//
//  OptionalBinding.swift
//  Coding Goals App
//
//  Created by Christopher Centrella on 3/8/23.
//

import Foundation
import SwiftUI

func OptionalBinding<T> (_ binding: Binding<T?>, defaultValue: T) -> Binding<T> {
    return Binding<T> {
        return binding.wrappedValue ?? defaultValue
    } set: { newValue in
        binding.wrappedValue = newValue
    }
}

func ??<T> (optional: Binding<T?>, defaultValue: T) -> Binding<T> {
    return OptionalBinding(optional, defaultValue: defaultValue)
}
