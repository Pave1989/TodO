//
//  SmallAddButton.swift
//  TodOLisT
//
//  Created by Павел Галкин on 06.08.2023.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundColor(.black)
            
                
        Text("+")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.green)
    }
        .frame(height: 50)
  }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
