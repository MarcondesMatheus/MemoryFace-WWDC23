//
//  ScoreView.swift
//  TestesImagem
//
//  Created by Matheus Barbosa on 17/04/23.
//

import SwiftUI



struct ScoreView: View {
    @State var score = 0
    var faceFeatures: FaceFeatures
    var gameFaceFeatures: GameFaceFeatures
    var gameView = GameView(faceFeatures: FaceFeatures())
    
    func verify(){
        if faceFeatures.hair == gameFaceFeatures.hair{
            score+=5
        }
        if faceFeatures.eyes == gameFaceFeatures.eyes{
            score+=5
        }
        if faceFeatures.nose == gameFaceFeatures.nose{
            score+=5
        }
        if faceFeatures.mouth == gameFaceFeatures.mouth{
            score+=5
        }
    }
    
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack{
                Text("RESULTS")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity).shadow(radius: 5)
                Spacer()
            }
            
            VStack{
                HStack{
                    Text("Game Face")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.white)
                    Spacer()
                    Text("Your Face")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.white)
                }
                Spacer()
            }.padding(.top, 50).padding(.leading, 25).padding(.trailing, 30).shadow(radius: 5)
            VStack{
                ZStack{
                    HStack{
                        Image("BackFace")
                            .resizable().scaledToFit()
                            .frame(width: 150, height: 150)
                            .background(Color.white.cornerRadius(30))
                        Spacer()
                        Image("BackFace")
                            .resizable().scaledToFit()
                            .frame(width: 150, height: 150).background(Color.white.cornerRadius(30))
                    }
                }
                Spacer()
            }.padding(.top, 65).padding().shadow(radius: 5)
            
            
            VStack{ // FACES FEATURES
                HStack{ // Hair
                    faceFeatures.hair?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 99, height: 99)
                   Spacer()
                    gameFaceFeatures.hair?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 99, height: 99)
                }.padding(.leading, 41).padding(.trailing, 41).padding(.top, 75)
                
                HStack{ // Eye
                    faceFeatures.eyes?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 99)
                   Spacer()
                    gameFaceFeatures.eyes?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 99)
                }.padding(.leading, 46).padding(.trailing, 45).padding(.top, -98)
                
                HStack{ // Nose
                    faceFeatures.nose?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 99)
                   Spacer()
                    gameFaceFeatures.nose?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 99)
                }.padding(.leading, 51).padding(.trailing, 50).padding(.top, -90)
                
                HStack{ // Mouth
                    faceFeatures.mouth?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 99)
                   Spacer()
                    gameFaceFeatures.mouth?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 99)
                }.padding(.leading, 50).padding(.trailing, 50).padding(.top, -90)
                Spacer()
            }
            
            ZStack{ //Score
                Color.white
                VStack{
                    Text("Your Score")
                    .font(.system(size: 33, weight: .heavy))
                    .foregroundColor(.purple).offset(y: 20)
                    HStack{
                        Text("Hair")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.purple)
                        Spacer()
                        ZStack{
                            Color.purple
                            if faceFeatures.hair == gameFaceFeatures.hair{
                                Text("5")
                                .font(.system(size:30, weight: .heavy))
                                .foregroundColor(.white)
                            }else{
                                Text("0")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.white)
                            }
                        }.frame(width: 45, height: 45).cornerRadius(25)
                    }
                    
                    HStack{
                        Text("Eyes")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.purple)
                        Spacer()
                        ZStack{
                            Color.purple
                            if faceFeatures.eyes == gameFaceFeatures.eyes{
                                Text("5")
                                .font(.system(size:30, weight: .heavy))
                                .foregroundColor(.white)
                            }else{
                                Text("0")
                                .font(.system(size: 35, weight: .heavy))
                                .foregroundColor(.white)
                            }
                        }.frame(width: 45, height: 45).cornerRadius(25)
                    }
                    
                    HStack{
                        Text("Nose")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.purple)
                        Spacer()
                        ZStack{
                            Color.purple
                            if faceFeatures.nose == gameFaceFeatures.nose{
                                Text("5")
                                .font(.system(size:30, weight: .heavy))
                                .foregroundColor(.white)
                            }else{
                                Text("0")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.white)
                            }
                        }.frame(width: 45, height: 45).cornerRadius(25)
                    }
                    
                    HStack{
                        Text("Mouth")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.purple)
                        Spacer()
                        ZStack{
                            Color.purple
                            if faceFeatures.mouth == gameFaceFeatures.mouth{
                                Text("5")
                                .font(.system(size:30, weight: .heavy))
                                .foregroundColor(.white)
                            }else{
                                Text("0")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.white)
                            }
                        }.frame(width: 45, height: 45).cornerRadius(25)
                    }
                    
                    ZStack{
                        Color.purple.cornerRadius(50)
                        Text("Total: \(score)")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                    }.frame(width: 250, height: 55).padding(.bottom, 20).onAppear{verify()}
                    
                }.padding(.horizontal)
            }.frame(height: 375).cornerRadius(25).padding().padding(.top, 95).shadow(radius: 5)
            
            VStack{
                Spacer()
                NavigationLink(destination: MemoryView(faceFeatures: faceFeatures).navigationBarBackButtonHidden(true)){
                    Text("Play Again")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.purple)
                        .padding(.horizontal, 55)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 5)
                }.padding(.top, -65)
                NavigationLink(destination: LastView().navigationBarBackButtonHidden(true)){
                    Text("Continue")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.purple)
                        .padding(.horizontal, 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 5)
                }.padding(.bottom)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(faceFeatures: FaceFeatures(), gameFaceFeatures: GameFaceFeatures())
    }
}
