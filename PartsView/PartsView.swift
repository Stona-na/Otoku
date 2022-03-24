//
//  PartsView.swift
//  Otoku
//
//  Created by 長谷部颯汰 on 2022/03/23.
//

import SwiftUI

struct PartsView: View {
    @State var text = ""
    var body: some View {
        DynamicHeightTextEditor(text: $text, placeholder: "テキストを入力", minHeight: 40, maxHeight: 150)
            
    }
    
}

struct PartsView_Previews: PreviewProvider {
    static var previews: some View {
        PartsView()
    }
}

//UIViewRepresentableはUIkitを使えるようにするAPI
struct DynamicHeightTextview: UIViewRepresentable {

    //入力値を反映するプロパティ
    @Binding var text: String

    //入力値を考慮したTextViewの高さを保持するプロパティ
    @Binding var height: CGFloat

    let textView = UITextView()

    //実装必須
    //ViewObjectを使うための関数（この場合UITextView)
    func makeUIView(context: Context) -> UITextView {
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.delegate = context.coordinator
        textView.textAlignment = .center
        

        return textView
    }

    //実装必須
    //つくられたViewについて、2回目以降行われる。
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    //Delegateメソッドを定義したクラスを返す
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicHeightTextView: self)
    }

    //UITextViewのDelegateメソッドを実装する
    //Coordinatorは、UIKitのイベントをSwiftUIに伝えるために必要
    //UITextViewDelegateはUITextViewオブジェクトの編集に関わる情報を受信するために使う。
    class Coordinator: NSObject, UITextViewDelegate {

        let dynamicHeightTextView: DynamicHeightTextview
        let textView: UITextView

        
        init(dynamicHeightTextView: DynamicHeightTextview) {
            self.dynamicHeightTextView = dynamicHeightTextView
            self.textView = dynamicHeightTextView.textView
        }

//TextViewが変更されたときの関数
        func textViewDidChange(_ textView: UITextView) {
            dynamicHeightTextView.text = textView.text
//sizeThatFitsは、コンテントをプレビューのサイズに合わせる。
            let textViewSize = textView.sizeThatFits(textView.bounds.size)
            dynamicHeightTextView.height = textViewSize.height
        }
    }
}

struct DynamicHeightTextEditor: View {

    @Binding var text: String
    @State var textHeight: CGFloat = 0

    var placeholder: String
    var minHeight: CGFloat
    var maxHeight: CGFloat

    //TextEditorの高さを保持するプロパティ
    var textEditorHeight: CGFloat {
        if textHeight < minHeight {
            return minHeight
        }

        if textHeight > maxHeight {
            return maxHeight
        }

        return textHeight
    }

    var body: some View {
        ZStack {
            //TextEditorの背景色
            Color.white

            //Placeholder
            if text.isEmpty {
                HStack {
                    Text(placeholder)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .padding(.top)
                        .padding(.bottom)
                        
                    
                }
            }

            DynamicHeightTextview(text: $text, height: $textHeight)
        }
        .frame(height: textEditorHeight) //← ここで高さを反映
        .border(Color.black, width: 1)
    }
}


    
    
    

