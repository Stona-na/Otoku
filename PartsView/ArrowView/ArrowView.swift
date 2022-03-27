//
//  ArrowView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/25.
//

import SwiftUI

struct Degrees: Codable, Identifiable {
    let id: Int
    let degree: Double
    
}


struct ArrowView: View {
    
    @State private var origin: CGPoint = CGPoint(x: 0, y: 0)
    @State private var step: CGPoint = CGPoint(x: 0, y: -100)
    @State private var nextPos: CGPoint = CGPoint(x: 0, y: 200)
    @State private(set) var PosLeft: CGPoint = CGPoint(x: -25, y: 180)
    @State private(set) var PosRight: CGPoint = CGPoint(x: 25, y: 180)
    @State var flg: [Double] = [0, 90, 180, 360]
    @State var flget: Double = 0
    
    
    
    
    var body: some View {
        VStack {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: origin.x, y: origin.y))
                    path.addLine(to: CGPoint(x: step.x, y: step.y))
                    path.addLine(to: CGPoint(x: origin.x, y: origin.y))
                    path.addLine(to: CGPoint(x: nextPos.x, y: nextPos.y))
                    path.addLine(to: CGPoint(x: PosLeft.x, y: PosLeft.y))
                    path.addLine(to: CGPoint(x: nextPos.x, y: nextPos.y))
                    path.addLine(to: CGPoint(x: PosRight.x, y: PosRight.y))
                }
                .stroke(Color.black, lineWidth: 10)
                .onTapGesture {
                    if flg  == [3] {
                        flget = flg[0]
                    } else {
                        flget += flg[1]
                    }
                    
                }
                .rotationEffect(Angle(
                    degrees: flget),
                                anchor: .zero
                )
                .offset(x: 100, y: 300)
                
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged{ value in
                    
                }
                            .onEnded{value in
                    self.origin = value.predictedEndLocation
                    
                })
                
            }
        }
    }
}





struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
