//
//  Gender.swift
//  BMICalculator
//
//  Created by 吳俊廷 on 2024/4/19.
//

import Foundation

enum gender: String{
    case male = "男生"
    case female = "女生"
    
    var symbolText: String{
        switch self {
            case .male: "♂"
            case .female: "♀"
        }
    }
}
