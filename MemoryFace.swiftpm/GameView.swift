//
//  GameView.swift
//  TestesImagem
//
//  Created by Matheus Barbosa on 12/04/23.
//

import SwiftUI

struct GameFaceFeatures {
var hair: Image?
var eyes: Image?
var nose: Image?
var mouth: Image?
}

struct GameView: View{
    let buttonTitles = ["Hair", "Eyes", "Nose", "Mouth"]
    var zero = 0
    @State var timerFinished = false
    @State var timeRemaining = 15
    @State var currentHair = Image("")
    @State var currentEye = Image("")
    @State var currentNose = Image("")
    @State var currentMouth = Image("")
    @State var isTimeUp = false
    @State var buttonsDisabled = false
    @State var buttonIndex = 0
    @State var currentImageNames = ["Hair01", "Hair02", "Hair03"]
    @State var gameFaceFeatures = GameFaceFeatures()
//    @State var indexHair
    let imageArrays = [
        ["Hair01", "Hair02", "Hair03"],
        ["Eyes01", "Eyes02", "Eyes03"],
        ["Nose01", "Nose02", "Nose03"],
        ["Mouth01", "Mouth02", "Mouth03"]
    ]
    
    var faceFeatures: FaceFeatures
    
    var body: some View{
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack { // TIMER
                if isTimeUp {
                    NavigationLink(
                        destination: ScoreView(faceFeatures: faceFeatures, gameFaceFeatures: gameFaceFeatures).navigationBarBackButtonHidden(true),
                        isActive: $isTimeUp,
                        label: { EmptyView() }
                    )
                } else {
                    Text(String(format: "%02d:%02d",zero ,timeRemaining))
                        .font(.system(size: 50, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .background(Color.black.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 500))
                }
                Spacer()
            }
            
            ZStack{
                VStack{
                    Circle()
                        .fill(Color.white) // Define a cor do círculo como branco
                        .frame(width: 350, height: 350)
                        .shadow(radius: 7)
                }
                Image("BackFace")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .shadow(radius: 7)
            }.padding(.bottom, 275)
            
            VStack{
                VStack{
                    NavigationLink(destination: ScoreView(faceFeatures: faceFeatures, gameFaceFeatures: gameFaceFeatures).navigationBarBackButtonHidden(true)) {
                                Text("Finish")
                                    .font(.system(size: 50, weight: .heavy))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 55)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 500))
                                    .shadow(radius: 7)
                        }
                    }
            }.padding(.top, 150)
            
            VStack{
                //Hair
                currentHair
                    .resizable()
                    .scaledToFit()
                    .frame(width: 205)
                    .padding(.bottom, 415)
            }
            VStack{
                // Eye
                currentEye
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding(.bottom, 380)
            }
            VStack{
                // Nose
                currentNose
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 40)
                    .padding(.bottom, 310)
            }
            VStack{
                //Mouth
                currentMouth
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 85)
                    .padding(.bottom, 235)
            }
            
            ZStack(alignment: .bottom){
                VStack{
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 5){
                            ForEach(0..<buttonTitles.count, id: \.self) { index in
                                Button{
                                    buttonIndex = index
                                    currentImageNames = imageArrays[index]
                                } label: {
                                    Text(buttonTitles[index])
                                        .foregroundColor(buttonIndex == index ? .white : .white)
                                        .padding(.horizontal, 25)
                                        .font(.system(size: 40, weight: .heavy))
                                        .background(Color.purple)
                                        .clipShape(RoundedRectangle(cornerRadius: 500))
                                    
                                }
                            }.padding(.bottom, 220).shadow(radius: 5)
                        }
                    }
                    .frame(height: 295)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(30)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom).ignoresSafeArea().shadow(radius: 5)
                
                
                ZStack{
                    ScrollView{
                        HStack{
                            ForEach(0..<currentImageNames.count, id: \.self) { index in
                                Button{
                                    switch buttonIndex {
                                    case 0:
                                        currentHair = Image(currentImageNames[index])
                                        gameFaceFeatures.hair = Image(currentImageNames[index])
                                    case 1:
                                        currentEye = Image(currentImageNames[index])
                                        gameFaceFeatures.eyes = Image(currentImageNames[index])
                                    case 2:
                                        currentNose = Image(currentImageNames[index])
                                        gameFaceFeatures.nose = Image(currentImageNames[index])
                                    case 3:
                                        currentMouth = Image(currentImageNames[index])
                                        gameFaceFeatures.mouth = Image(currentImageNames[index])
                                    default:
                                        break
                                    }
                                }label: {
                                    Image(currentImageNames[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 110, height: 115)
                                }.disabled(buttonsDisabled)
                                
                                
                            }.background(Color.black.opacity(0.2)).cornerRadius(30)
                        }
                    }.padding(.top, 600)
                }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            timer.invalidate()
                            isTimeUp = true
                            buttonsDisabled = true
                        }
                    }
                }
                
            }
        }
    }
}
