//
//  TestView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/25.
//

import SwiftUI

struct TestView: View {
    @State private var CurrentPos: CGPoint = CGPoint(x:100, y:100)
    
    
    
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: CurrentPos.x - 100, y: CurrentPos.y))
                path.addLine(to: CGPoint(x: CurrentPos.x + 100, y: CurrentPos.y + 0))
            }
            .stroke(lineWidth: 1)
            .fill(Color.black)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.CurrentPos = value.location
                        
                        
                    })
            
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
