//
//  GenderButton.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/19.
//

import SwiftUI

struct GenderButton: View {
    let gender: gender
    @Binding var selectGender: gender 
    @Binding var mainColor: Color
    
    var isSelected: Bool{
        gender==selectGender
    }
    
    var body: some View {
        Button{
            selectGender=gender
        }label: {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color("blockGray"))
                .overlay{
                    VStack(spacing:16){
                        Text(gender.symbolText)
                            .font(.system(size: 80))
                            .foregroundStyle(mainColor)
                        Text(gender.rawValue)
                    }
                    .font(.title2)
                    .foregroundStyle(.white)
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: isSelected ? 3 : 0)
                        .foregroundStyle(mainColor)
                }
                
                
        }
    }
}

#Preview {
    struct Preview: View{
        @State var testGender = gender.female
        @State var mainColor = Color("lightGreen")
        var body: some View{
            HStack(spacing:16){
                GenderButton(gender: .female, selectGender: $testGender, mainColor: $mainColor)
                GenderButton(gender: .male, selectGender: $testGender, mainColor: $mainColor)
            }
            .frame(height: 200)
        }
        
    }
    return Preview()
}
