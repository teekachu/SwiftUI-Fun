//
//  CoursesView.swift
//  DesignCode.iOS14
//
//  Created by Tee Becker on 11/9/20.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace // set a collection of match elements
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            ScrollView() {
                /// if lazy H grid, set scrollview to .horizontal, and might not want to set fixed height.
                LazyVGrid(
                    /// first way:
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                    
//                    columns: [
//                         ///second way : set minimum width and xcode will try to fit as many row as can. applies to all
////                        GridItem(.adaptive(minimum: 250),spacing: 16),
//
//                        ///third way: can customize the width and spacing between different rows.
//                        //                        GridItem(.fixed(250),spacing: 10),
//                        //                        GridItem(.fixed(160),spacing: 30),
//                        //                        GridItem(.fixed(100),spacing: 50),
//                        //                        GridItem(.fixed(50), spacing: 70)
//                    ], /// the spacing within is between each card horizontally
                    
                    spacing: 16
                )
                { /// this spacing is between each card vertically
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                // matchedGeometry would not work well if there are a lot of different element ( card )
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200) // height of card
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        /// add unique name and id
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            .zIndex(1)
            
            if selectedItem != nil {
          
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                .frame(height: 300)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selectedItem = nil
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            isDisabled = false
                                        }
                                    }
                                }
                            
                            VStack {
                                ForEach(0 ..< 20) { item in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
//                    .transition(
//                        .asymmetric(
//                            insertion:  AnyTransition
//                                .opacity
//                                .animation(Animation.spring().delay(0.3)),
//
//                            removal: AnyTransition
//                                .opacity
//                                .animation(.spring()))
//                    )
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(2)
                    
                
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
