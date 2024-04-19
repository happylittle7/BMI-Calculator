//
//  ContentView.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/18.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var shouldShowResult = false
    @State var shouldShowSetting = false
    @State var yearsOld = 18
    @State var height: Double = 160
    @State var weight = 60
    //目前選的性別
    @State var selectGender = gender.female
    
    @State var mainColor = Color("lightGreen")
    
    var body: some View {
        VStack(alignment: .leading,spacing:16) {
            HStack {
                Label("BMI 計算機",systemImage: "figure.mind.and.body")
                    .font(.title3)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button{
                    shouldShowSetting = true
                }label:{
                    Image(systemName: "gear")
                        .foregroundStyle(mainColor)
                        .imageScale(.large)
                    
                }
            }
            Grid(horizontalSpacing:16,verticalSpacing: 16){
                GridRow{
                    GenderButton(gender: .female, selectGender: $selectGender, mainColor: $mainColor)
                    GenderButton(gender: .male, selectGender: $selectGender, mainColor: $mainColor)
                }
                GridRow{
                    HeightBlock(height: $height,mainColor: $mainColor)
                        .gridCellColumns(2)
                }
                GridRow{
                    NumberStepper(title: "體重", value: $weight, unit: "公斤", mainColor: $mainColor)
                    NumberStepper(title: "年紀", value: $yearsOld, unit: "歲", mainColor: $mainColor)
                }
            }
            countRectangle()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .background(.black)
        .sheet(isPresented: $shouldShowSetting){
            SettingsView(mainColor: $mainColor)
                .presentationDetents([.medium])
        }
        .alert("您的 BMI 為\(bmi.formatted(.number.precision(.fractionLength(2))))", isPresented: $shouldShowResult){
            
        }
    }
    
    var bmi: Double{
        Double(weight) / ((height/100) * (height/100))
    }
    
    func countRectangle() -> some View{
        Button{
            shouldShowResult = true
        }label:{
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(mainColor)
                .frame(height:100)
                .overlay{
                    Text("計算")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .bold()
                }
        }
    }
}

#Preview {
    ContentView()
}
