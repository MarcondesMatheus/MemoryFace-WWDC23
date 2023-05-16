//
//  FirstView.swift
//  TestesImagem
//
//  Created by Matheus Barbosa on 12/04/23.
//

import SwiftUI

struct FirstView: View {
    @State var next = false
    @State var random = true
    @State var currentImageIndex = 0
    @State var currentImageIndex2 = 1
    
    let imgHair = [Image("Hair01"), Image("Hair02"), Image("Hair03")]
    let imgEye = [Image("Eyes01"), Image("Eyes02"), Image("Eyes03")]
    let imgNose = [Image("Nose01"), Image("Nose02"), Image("Nose03")]
    let imgMouth = [Image("Mouth01"), Image("Mouth02"), Image("Mouth03")]
    
    var body: some View {
        
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack{
                Text("Memory")
                    .font(.system(size: 65, weight: .heavy))
                    .foregroundColor(.white)
                Text("Face")
                    .font(.system(size: 65, weight: .heavy))
                    .foregroundColor(.white)
                
            }.padding(.bottom, 300)
            VStack{
                Spacer()
                ZStack{
                    Image("BackFace").resizable().scaledToFit().frame(height: 450).offset(x:-185, y:70)
                    Image("BackFace").resizable().scaledToFit().frame(height: 450).offset(x:185, y:70)
                    HStack{
                        VStack{
                            imgHair[currentImageIndex].resizable().scaledToFit().frame(width: 250).offset(x:-40, y: 65)
                            imgEye[currentImageIndex].resizable().scaledToFit().frame(width: 215).offset(x:-55, y: -70)
                            imgNose[currentImageIndex].resizable().scaledToFit().frame(width: 220).offset(x:-60, y: -90)
                            imgMouth[currentImageIndex].resizable().scaledToFit().frame(width: 215).offset(x:-65, y: -90)
                        }
                        VStack{
                            imgHair[currentImageIndex2].resizable().scaledToFit().frame(width: 250).offset(x:40, y: 65)
                            imgEye[currentImageIndex2].resizable().scaledToFit().frame(width: 215).offset(x:55, y: -70)
                            imgNose[currentImageIndex2].resizable().scaledToFit().frame(width: 220).offset(x:60, y: -90)
                            imgMouth[currentImageIndex2].resizable().scaledToFit().frame(width: 215).offset(x:65, y: -90)
                        }
                    }
                    
                }
            }
            
            VStack{
                Spacer()
                Button{
                    next = true
                    random = false
                } label: {
                    Image("btnPlay").frame(width: 200, height: 250)
                }
                
                if next {
                    NavigationLink(
                        destination: HistoryView().navigationBarBackButtonHidden(true),
                        isActive: $next,
                        label: {EmptyView()})
                }
            }.padding(.bottom, -50)
            
            
        }.onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                if random {
                    currentImageIndex = Int.random(in: 0..<imgHair.count)
                    currentImageIndex2 = Int.random(in: 0..<imgHair.count)
                } else {
                    timer.invalidate()
                }
            }
            
        }
        
    }
}
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
