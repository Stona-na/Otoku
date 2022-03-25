//
//  StickView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/24.
//

import SwiftUI



struct StickView: View {
    @State private var CurrentPos: CGPoint = CGPoint(x:100, y:100)
    @State private var CurrentPosEnd: CGPoint = CGPoint(x:200, y:100)
    


    var body: some View {
        
        
        VStack {
            
            ZStack{
                
                    Path { path in
                        path.move(to: CGPoint(x: CurrentPos.x, y: CurrentPos.y))
                        path.addLine(to: CGPoint(x: CurrentPosEnd.x , y: CurrentPosEnd.y))
                    }
                    .stroke(lineWidth: 1)
                    .fill(Color.black)
                
                    Path { path in
                        path.move(to: CGPoint(x: CurrentPos.x, y: CurrentPos.y))
                        path.addLine(to: CGPoint(x: CurrentPosEnd.x , y: CurrentPosEnd.y))
                    }
                    .stroke(lineWidth: 1)
                    .fill(Color.gray)
                
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
                    .position(x: CurrentPosEnd.x, y: CurrentPosEnd.y)
                
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .global)
                            .onChanged { value in
                                self.CurrentPosEnd = value.location
                            })
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
                    .position(x: CurrentPos.x, y: CurrentPos.y)
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { value in
                        self.CurrentPos = value.location
                    })
        }
        
       
    }

    }





struct StickView_Previews: PreviewProvider {
    static var previews: some View {
        StickView()
    }
}
