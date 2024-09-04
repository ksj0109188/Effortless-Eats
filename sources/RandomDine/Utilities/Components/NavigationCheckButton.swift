//
//  NavigationCheckButton.swift
//  RandomDine
//
//  Created by 김성준 on 9/4/24.
//

import SwiftUI

struct NavigationCheckButton: View {
    @Environment(\.dismiss) var dismiss
    
    let color: Color?
    var completeDismiss: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            
            if completeDismiss {
                dismiss()
            }
        } label: {
            Image(systemName: "checkmark")
                .font(.title3)
                .foregroundStyle(color ?? .primary)
                .bold()
        }
    }
}

#Preview {
    NavigationCheckButton(color: .black, action: {})
}
