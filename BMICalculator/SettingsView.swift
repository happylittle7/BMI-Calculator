//
//  Settings.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/19.
//

import SwiftUI

struct SettingsView: View {
    @Binding var mainColor: Color
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack(){
            Form{
                Section("顏色設定"){
                    ColorPicker("主要顏色",selection: $mainColor)
                }
                
            }
            .navigationTitle("設定")
            .toolbar{
                ToolbarItem(placement:.primaryAction){
                    Button{
                        dismiss()
                    }label:{
                        Text("完成")
                    }
                }
            }
        }
        
    }
}

#Preview {
    struct Preview: View{
        @State var mainColor = Color(.red)
        var body: some View{
            SettingsView(mainColor: $mainColor)
        }
    }
    return Preview()
}
