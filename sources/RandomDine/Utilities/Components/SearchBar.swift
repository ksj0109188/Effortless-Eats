//
//  SearchBar.swift
//  RandomDine
//
//  Created by 김성준 on 6/16/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("장소, 음식점을 입력해주세요", text: $text)
                    .onSubmit {
                        onSearch()
                    }
                    .foregroundColor(.primary)
                  
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: text.isEmpty ? "circle" : "xmark.circle.fill")
                        .foregroundColor(text.isEmpty ? .clear : .secondary)
                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant(""), onSearch: {})
}
