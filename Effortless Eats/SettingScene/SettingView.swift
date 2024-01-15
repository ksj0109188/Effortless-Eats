//
//  SettingView.swift
//  Effortless Eats
//
//  Created by 김성준 on 1/11/24.
//

import SwiftUI


//검색 조건
//TODO: 위치정보 제공 설정
struct SettingView: View {
    @State private var speed = 500.0
    @State private var isEditing = false
    @AppStorage("serachDistance") var serachDistance: Double = 500.0
    
    var body: some View {
        List {
            Section {
                Text("검색거리 설정")
                HStack{
                    Slider(
                        value: $speed,
                        in: 0...20000,
                        step: 1.0,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    Stepper("", value: $speed, step: 100)
                        .pickerStyle(.segmented)
                    
                }
                Text("\(Int(speed))m")
                    .foregroundColor(isEditing ? .red : .blue)
            } footer: {
                Text("m단위로 설정 거리내 무작위 음식점을 표출합니다.")
            }
            Button(action: {
                serachDistance = speed
            }, label: {
                Text("저장")
            })
            Text("위치정보 제공 동의여부")
//            if(CLLocationManager.headingAvailable()) {}
        }
    }
}

#Preview {
    SettingView()
}
