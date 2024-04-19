//
//  NumberStepper.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/19.
//

import SwiftUI

struct NumberStepper: View {
    let title: String
    @Binding var value: Int
    let unit: String
    
    @Binding var mainColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(Color("blockGray"))
            .overlay{
                VStack(spacing:16){
                    Text(title)
                    HStack(spacing:16){
                        Button{
                            if value>0 {
                                value-=1
                            }
                        }label:{
                            Image(systemName: "minus.square.fill")
                        }
                        Text(value.formatted())
                            .foregroundStyle(.white)
                            .bold()
                        Button{
                            value+=1
                        }label:{
                            Image(systemName: "plus.square.fill")
                        }
                    }
                    .font(.largeTitle)
                    .foregroundStyle(mainColor)
                    Text(unit)
                }
                
                    
            }
            .foregroundStyle(.white)
            .font(.title2)
    }
}

#Preview {
    struct Preview: View{
        @State var yearsOld = 22
        @State var weight = 59
        @State var mainColor = Color("lightGreen")
        var body: some View{
            HStack(spacing:16){
                NumberStepper(title: "體重", value: $weight, unit: "公斤", mainColor: $mainColor)
                NumberStepper(title: "年紀", value: $yearsOld, unit: "歲", mainColor: $mainColor)
            }
            .frame(height:200)
        }
    }
    
    return Preview()
}
