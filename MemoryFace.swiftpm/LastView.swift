//
//  LastView.swift
//  TestesImagem
//
//  Created by Matheus Barbosa on 18/04/23.
//

import SwiftUI

struct LastView: View {
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack{
                Text("Remember to always exercise your memory, it is very important and stores everything we know and love.")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.white)
                    .padding()
                
                Text("Thanks For Play")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
            VStack{
                Spacer()
                NavigationLink(destination: FirstView().navigationBarBackButtonHidden(true)){
                    Text("Back to Start")
                        .font(.system(size: 35, weight: .heavy))
                        .foregroundColor(.purple)
                        .padding(.horizontal, 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 5)
                }
            }
        }
        
       
    }
}
struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
    }
}
