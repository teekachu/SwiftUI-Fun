//
//  CourseList.swift
//  DesignCode.iOS14
//
//  Created by Tee Becker on 11/10/20.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        List(0 ..< 5) { item in
            CourseRow()
        }
//        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
