//
//  HeightBlock.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/19.
//

import SwiftUI

struct HeightBlock: View {
    @Binding var height: Double
    @Binding var mainColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(Color("blockGray"))
            .overlay{
                VStack(spacing:16){
                    Text("身高")
                        .font(.title2)
                    Text("\(height.formatted())公分")
                        .font(.largeTitle)
                        .bold()
                    Slider(value: $height,in: 1...300,step: 1)
                        .tint(mainColor)
                        .padding(.horizontal)
                }
                .foregroundStyle(.white)
            }
    }
}

#Preview {
    struct Preview: View{
        @State var height:Double = 160
        @State var mainColor = Color(.red)
        var body: some View{
            HeightBlock(height: $height, mainColor: $mainColor)
                .frame(height:200)
        }
        
    }
    return Preview()
}
