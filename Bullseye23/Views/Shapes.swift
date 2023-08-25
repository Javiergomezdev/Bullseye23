//
//  Shapes.swift
//  Bullseye23
//
//  Created by Javier Gomez on 25/07/23.
//

import SwiftUI

struct Shapes: View {
    @State private var wideshapes = false
    var body: some View {
        VStack {
            if !wideshapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.slide)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: wideshapes ? 200 : 100, height: 100)
            //   .animation(.easeInOut, value: wideshapes)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideshapes ? 200 : 100, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideshapes ? 200 : 100, height: 100)
            Button("Animate!") {
                withAnimation{
                    wideshapes.toggle()
                    //toggle sirve para hacer cambiar el valor al opuesto
                }
            }
        }
    }
}
struct Shapes_Previews: PreviewProvider {
            static var previews: some View {
                Shapes()
    }
}

