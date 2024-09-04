//
//  NavigationBackButton.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/17/24.
//

import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    let color: Color?
    var type: ButtonType = .Back
    let action: () -> Void
    
    var symbolName: String {
        type == .Back ? "chevron.left" : "xmark"
    }
    
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Image(systemName: symbolName)
                .font(.title3)
                .foregroundStyle(color ?? .primary)
                .bold()
        }
    }
    
    enum ButtonType {
        case Back
        case Cancel
    }
}
