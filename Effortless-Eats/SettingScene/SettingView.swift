//
//  SettingView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/11/24.
//

import SwiftUI

struct SettingView: View {
    @State private var isEditing = false
    @AppStorage("serachDistance") var serachDistance: Double = 500.0
    @Environment(\.dismiss) var dismiss
    
    var transformDistance: String {
        if serachDistance / 1000 >= 1 {
            return "\(Double(serachDistance / 1000))km"
        } else {
           return "\(serachDistance)m"
        }
    }
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    VStack(spacing: 20){
                        HStack{
                            Slider(
                                value: $serachDistance,
                                in: 0...20000,
                                step: 1.0,
                                onEditingChanged: { editing in
                                    isEditing = editing
                                }
                            )
                            .frame(width: 200)
                            Stepper("", value: $serachDistance, step: 100)
                                .pickerStyle(.segmented)
                            
                        }
                        Divider()
                        Text(transformDistance)
                            .foregroundColor(isEditing ? .red : .blue)
                    }
                } header: {
                    Text("검색범위 설정")
                        .font(.title2)
                } footer: {
                    Text("설정 거리내 무작위 음식점을 표출합니다.")
                        .font(.footnote)
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(id: "close", placement: .cancellationAction) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("닫기")
                        .font(.headline)
                })
                .foregroundStyle(Color.red)
            }
        })
    }
}

#Preview {
    NavigationStack{
        SettingView()
    }
}
