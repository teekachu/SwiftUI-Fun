//
//  CourseRow.swift
//  DesignCode.iOS14
//
//  Created by Tee Becker on 11/9/20.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        
        HStack(spacing: 10) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template)
                .frame(width: 48, height: 48)
                .imageScale(.medium)
                .background(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                .clipShape(Circle())
                .foregroundColor(Color.white)
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("SwiftUI")
                    .font(.subheadline)
                Text("Description")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
        }
//        .frame(maxWidth: .infinity)
        .padding(5)
        

    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
