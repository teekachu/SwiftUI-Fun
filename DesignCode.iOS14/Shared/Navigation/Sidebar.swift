//
//  Sidebar.swift
//  DesignCode.iOS14
//
//  Created by Tee Becker on 11/9/20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            
            Content()
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                    Image(systemName: "person.crop.circle")
                }}
            
            CoursesView()
        }
    }
}


struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Sidebar()
        }
    }
}


struct Content: View {
    var body: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Scribble", systemImage: "scribble.variable")
            Label("Stars", systemImage: "lasso.sparkles")
            Label("Bunny", systemImage: "tortoise.fill")
            Label("Pills", systemImage: "pills")
        }
        .listStyle(SidebarListStyle())
    }
}
