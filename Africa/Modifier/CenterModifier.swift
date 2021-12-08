//
//  CenterModifier.swift
//  Africa
//
//  Created by Deep Bose on 6/17/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body (content: Content) -> some View  {
        HStack{
            Spacer()
            content
            Spacer()
        }//: HSTACK
    }
}
