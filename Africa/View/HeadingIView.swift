//
//  HeadingIView.swift
//  Africa
//
//  Created by Deep Bose on 5/28/21.
//

import SwiftUI

struct HeadingIView: View {
    
    // MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: HSTACK
    }
}

// MARK: - PREVIEW

struct HeadingIView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingIView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
