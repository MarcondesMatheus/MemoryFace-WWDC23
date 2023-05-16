    import SwiftUI

    struct FaceFeatures {
    var hair: Image?
    var eyes: Image?
    var nose: Image?
    var mouth: Image?
    }

    struct MemoryView: View {
    @State var timeRemaining = 10
    var zero = 0
    @State var timerFinished = false
    @State var faceFeatures = FaceFeatures()
    let imgHair = [Image("Hair01"), Image("Hair02"), Image("Hair03")]
    let imgEye = [Image("Eyes01"), Image("Eyes02"), Image("Eyes03")]
    let imgNose = [Image("Nose01"), Image("Nose02"), Image("Nose03")]
    let imgMouth = [Image("Mouth01"), Image("Mouth02"), Image("Mouth03")]
        
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack{
                Text("REMEMBER THE FACE")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 5)
                    .padding(.top, 30)
                Spacer()
            }.frame(maxWidth: .infinity)
            
            VStack { // Timer
                Text(String(format: "%02d:%02d",zero ,timeRemaining))
                .font(.system(size: 50, weight: .heavy))
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .background(Color.black.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 500))
                .padding(.top, 95)

                NavigationLink(
                    destination: GameView( faceFeatures: faceFeatures).navigationBarBackButtonHidden(true),
                    isActive: $timerFinished,
                    label: { EmptyView() }
                )
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
                    .shadow(radius: 5)
            }.padding(.bottom, 50)
                HStack{ // Hair
                    faceFeatures.hair?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 205, height: 205)
                        .padding(.bottom, 185)
                }
                HStack{ // Eye
                    faceFeatures.eyes?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .padding(.bottom, 150)
                }
                HStack{ // Nose
                    faceFeatures.nose?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 40)
                        .padding(.bottom, 85)

                }
                HStack{ // Mouth
                    faceFeatures.mouth?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 85)
                        .padding(.bottom)
                        
                        
                }
                VStack{
                    Spacer()                    
                    Button{
                        timeRemaining = 0
                    } label: {
                        Text("Skip")
                            .font(.system(size: 50, weight: .heavy))
                            .foregroundColor(.purple)
                            .padding(.horizontal, 55)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 500))
                            .shadow(radius: 7)
                    }.padding(.bottom, 135)
                    
                }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            timer.invalidate()
                            timerFinished = true
                        }
                    }
                }
                }.onAppear {
                    // random and save
                    faceFeatures.hair = imgHair.randomElement()
                    faceFeatures.eyes = imgEye.randomElement()
                    faceFeatures.nose = imgNose.randomElement()
                    faceFeatures.mouth = imgMouth.randomElement()
                }
        }
        
        }

struct MemoryView_Preview: PreviewProvider {
    static var previews: some View {
        MemoryView()
    }
}
        
    

    
