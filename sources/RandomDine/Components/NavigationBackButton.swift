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
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .font(.title3)
                .foregroundStyle(color ?? .primary)
                .bold()
        }
    }
}

#Preview {
    NavigationBackButton(color: Color.blue, action: {})
}
