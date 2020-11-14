//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by Aji_sahputra on 14/11/20.
//

import SwiftUI


struct ContentView: View {
  @State var progressValue: Float = 0.0
  
    var body: some View {
      ZStack{
        Color.red
          .opacity(0.1)
          .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        VStack{
          ProgressBar(progress: self.$progressValue)
            .frame(width: 150.0, height: 150.0)
            .padding(140.0)
          
          Button(action: {
            self.incrementProgress()
          }){
            
            HStack{
              Image(systemName: "square.and.arrow.down.on.square.fill")
              Text("Download")
            }
            .padding(15.0)
            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(lineWidth: 3.0))
          }
          
          Spacer()
        }
      }
    }
  
  func incrementProgress() {
    if progressValue != 1 {
      Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
        self.progressValue += 0.1
        self.incrementProgress()
        
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct  ProgressBar: View {
  
  @Binding var progress: Float
  
  var body : some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 20.0)
        .opacity(0.3)
        .foregroundColor(Color.blue)
      
      Circle()
        .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(min(self.progress, 1.0)))
        .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
        .foregroundColor(Color.blue)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear)
      
      Text(String(format: "%.0f %%", min(self.progress, 1.0) * 100.0))
        .font(.largeTitle)
        .bold()
    }
  }
  
}
