//
//  HistoryView.swift
//  TestesImagem
//
//  Created by Matheus Barbosa on 12/04/23.
//

import SwiftUI

struct HistoryView: View {
    @State var currentIndex = 0
    @State var next = false
    
    let texts = ["Hello, before start this game, I'd like to tell you a few things.","I would like to comment on the very alarming indexes about dementia and Alzheimer.","Dementia is not a specific disease but a group of symptoms, Alzheimer is the most common type of dementia, causing problems in memory, thinking and behavior.","Surely the saddest part, one of the consequences of Alzheimer's is prosopagnosia, the difficulty in recognizing familiar faces, such as relatives and friends.","This problem has a significant impact on the lives of family members, as the loss of the ability to recognize faces can lead to loss of social connections and isolation.", "Now it's time to test and exercise your memory with the faces."]
    
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
                VStack{
                    Spacer()
                        VStack{
                            Text(texts[currentIndex])
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.white)
                                .padding(.bottom, 200)
                            Button{
                                if currentIndex < texts.count - 1 {
                                    currentIndex += 1
                                } else {
                                    next = true
                                }
                            } label: {
                                Text(currentIndex == texts.count - 1 ? "Play" : "Next")
                                    .font(.system(size: 50, weight: .heavy))
                                    .foregroundColor(.purple)
                                    .padding(.horizontal, 55)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 500))
                                    .shadow(radius: 7)
                                    .padding(.bottom, 80)
                            }
                            if next {
                                NavigationLink(
                                    destination: MemoryView().navigationBarBackButtonHidden(true),
                                    isActive: $next,
                                    label: {
                                        EmptyView()
                                    })
                            }
                            
                        }.padding()
                    }.padding()
            
           
            }
        }
    }
    
    struct HistoryView_Previews: PreviewProvider {
        static var previews: some View {
            HistoryView()
        }
    }


