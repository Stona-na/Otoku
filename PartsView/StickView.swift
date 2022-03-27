//
//  StickView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/24.
//

import SwiftUI



struct StickView: View {
    
    var body: some View {
        
        
        VStack {
            
            StickPartsView()
            
        }
        
        
    }
}




struct StickView_Previews: PreviewProvider {
    static var previews: some View {
        StickView()
    }
}



struct StickPartsView: View {
    @State private var InitCurrentPos: CGPoint = CGPoint(x:0, y:0)
    @State private var CurrentPos: CGPoint = CGPoint(x:200, y:100)
    @State private var CurrentPosBlue: CGPoint = CGPoint(x:300, y:0)
    @State private var CurrentPosRed: CGPoint = CGPoint(x:100, y:100)
    @State private var RedSaved: CGPoint = CGPoint(x:100, y:100) //ok?
    @State private var BlueSaved: CGPoint = CGPoint(x:300, y:100) //ok?
    @State private var DistanceRed: CGFloat = 0
    @State private var DistanceBlue: CGFloat = 0
    
    
    var body: some View {
        
        
        
        
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: CurrentPosRed.x, y: CurrentPos.y))
                path.addLine(to: CGPoint(x: CurrentPosBlue.x, y: CurrentPos.y))
            }
            .stroke(lineWidth: 10)
            .gesture(DragGesture(minimumDistance: 0)
                        .onChanged{ value in
                
                self.InitCurrentPos = value.startLocation
                self.CurrentPos = value.location
                
                CurrentPosRed.x = CurrentPos.x - (InitCurrentPos.x - RedSaved.x)
                CurrentPosBlue.x = CurrentPos.x - (InitCurrentPos.x - BlueSaved.x)
                
            })
            
            
            Circle()
                .fill(Color.red)
                .frame(width: 10, height: 10)
                .position(x: CurrentPosRed.x, y: CurrentPos.y)
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged{ value in
                    self.CurrentPosRed = value.location
                }
                            .onEnded{value in
                    self.RedSaved = value.predictedEndLocation
                })
            
            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
                .position(x: CurrentPosBlue.x, y: CurrentPos.y)
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged{ value in
                    self.CurrentPosBlue = value.location
                    
                }
                            .onEnded{value in
                    self.BlueSaved = value.predictedEndLocation
                    
                })
        }
    }
}
struct ExtractedView: View {
    var body: some View {
        StickPartsView()
    }
}
