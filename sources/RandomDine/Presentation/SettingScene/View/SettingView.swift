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
        NavigationStack {
            List {
                Section {
                    VStack(spacing: 20) {
                        HStack {
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
                        Text(transformDistance)
                            .foregroundColor(isEditing ? .red : .black)
                    }
                } header: {
                    Text("검색범위 설정")
                        .font(.title3)
                } footer: {
                    Text("설정 거리내 무작위 음식점을 표출합니다.")
                        .font(.footnote)
                }
                
                Section {
                    VStack {
                        Button(action: {
                            setCoordinate()
                        }, label: {
                            Text("설정가기")
                        })
                    }
                }  header: {
                    Text("위치설정")
                        .font(.title3)
                } footer: {
                    Text("추첨되는 음식점이 거리가 너무 크다면 위치 정보를 설정해주세요 위치 기반으로 추첨되기 떄문에 권장드립니다.")
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
    
    func setCoordinate() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingView()
    }
}
