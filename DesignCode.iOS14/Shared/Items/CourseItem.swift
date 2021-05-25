//
//  CourseItem.swift
//  DesignCode.iOS14
//
//  Created by Tee Becker on 11/10/20.
//

import SwiftUI

struct CourseItem: View {
    var course: Course = courses[0] //default value
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Spacer()
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            Text(course.title)
                .fontWeight(.bold)
            
            Text(course.subtitle)
                .font(.footnote)
            
        }
        .padding(.all)
        .background(course.color)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 20, x: 0, y: 10)
        .foregroundColor(Color("Background 1"))
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
