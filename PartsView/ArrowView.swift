//
//  ArrowView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/25.
//

import SwiftUI

struct ArrowView: View {
    var body: some View {
        VStack {
        Path { path in
            path.move(to: CGPoint(x:-100, y:25))
            path.addLine(to: CGPoint(x: 100, y: 25))
            path.addLine(to: CGPoint(x: 80, y: 45))
            path.addLine(to: CGPoint(x: 100, y: 25))
            path.addLine(to: CGPoint(x: 80, y: 5 ))
        }
        .stroke(lineWidth: 1)
        .fill(Color.black)
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
