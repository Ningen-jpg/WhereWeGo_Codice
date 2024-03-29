//
//  ContentView.swift
//  VistaQuiztvOS
//
//  Created by Stefano Leva on 03/07/22.
//

import SwiftUI
import AVKit
import AVFoundation

struct QuestionViewtvOS: View {
    @Binding var viewNumber: Int
    @ObservedObject var userConnection: UserConnection
    @State private var isValid = false
    @State private var isAsking = false


    
    
    
    let mpcManager = MPCManager.shared
    let question: Question
    var bounds = UIScreen.main.bounds
    let redGradient = LinearGradient(colors: [Color(red: 0.9, green: 0.4, blue: 0.4, opacity: 1), Color(red: 0.9, green: 0.1, blue: 0.1, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let greenGradient = LinearGradient(colors: [Color(red: 0.4, green: 0.9, blue: 0.4, opacity: 1), Color(red: 0.1, green: 0.9, blue: 0.1, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let blueGradient = LinearGradient(colors: [Color(red: 0.4, green: 0.4, blue: 0.9, opacity: 1), Color(red: 0.1, green: 0.1, blue: 0.9, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let purpleGradient = LinearGradient(colors: [Color(red: 0.6, green: 0.4, blue: 0.6, opacity: 1), Color(red: 0.6, green: 0.1, blue: 0.6, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    let wgGradient = LinearGradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 1), Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
        ZStack{
            
            
                Text("Title")
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        if(userConnection.numQuestion != viewNumber && mpcManager.result == false){
                            print(viewNumber)
                            if(userConnection.numQuestion == 12){
                                userConnection.numQuestion = 2
                                mpcManager.result = true
                                viewNumber = 12
                                timer.invalidate()
                            }
                            else{
                                viewNumber = userConnection.numQuestion
                            }
                        }
                    }
                       
                }
            
            //Call PlayerView for Looped Videos

            PlayerView(video: "Mixato")
                .edgesIgnoringSafeArea(.all)

            

            VStack(spacing: bounds.height * 0.075){

                HStack(spacing: bounds.height * 0.075){

                  

                    ZStack {

                        Rectangle()
                            .fill(redGradient)
                                .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                                .cornerRadius(20)
                                .opacity(0.7)
                                .shadow(color: .black, radius: 20, x: 0, y: 35)

                        Rectangle()
                            .fill(redGradient)
                            .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                            .cornerRadius(20)
                            .opacity(0.3)
                            .blur(radius: 15)

                        Text("\(question.option1)")
                            .foregroundColor(.white)
                            .font(.system(size: bounds.height * 0.045, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .frame(width: bounds.size.width * 0.23, height: bounds.size.height * 0.23)
                        }.scaleEffect(isAsking ? 1.03 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), {
                                isAsking.toggle()
                            })
                        }
                    
                        Spacer()

                    ZStack {

                        Rectangle()
                            .fill(greenGradient)
                                .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                                .cornerRadius(20)
                                .opacity(0.7)
                                .shadow(color: .black, radius: 20, x: 0, y: 35)

                        Rectangle()
                            .fill(greenGradient)
                            .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                            .cornerRadius(20)
                            .opacity(0.3)
                            .blur(radius: 15)

                        Text("\(question.option2)")
                            .foregroundColor(.white)
                            .font(.system(size: bounds.height * 0.045, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .frame(width: bounds.size.width * 0.23, height: bounds.size.height * 0.23)
                        }.scaleEffect(isAsking ? 1.03 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), {
                                isAsking.toggle()
                            })
                        }
                    
                }
                .frame(width: bounds.width * 0.9, height: bounds.height * 0.35)

                Spacer()

                HStack(spacing: bounds.height * 0.075){

                    ZStack {

                        Rectangle()
                            .fill(blueGradient)
                                .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                                .cornerRadius(20)
                                .opacity(0.7)
                                .shadow(color: .black, radius: 20, x: 0, y: 35)

                        Rectangle()
                            .fill(blueGradient)
                            .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                            .cornerRadius(20)
                            .opacity(0.3)
                            .blur(radius: 15)

                        Text("\(question.option3)")
                            .foregroundColor(.white)
                            .font(.system(size: bounds.height * 0.045, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .frame(width: bounds.size.width * 0.23, height: bounds.size.height * 0.23)
                        }.scaleEffect(isAsking ? 1.03 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), {
                                isAsking.toggle()
                            })
                        }

                    Spacer()

                    ZStack {

                        Rectangle()
                            .fill(purpleGradient)
                                .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                                .cornerRadius(20)
                                .opacity(0.7)
                                .shadow(color: .black, radius: 20, x: 0, y: 35)

                        Rectangle()
                            .fill(purpleGradient)
                            .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                            .cornerRadius(20)
                            .opacity(0.3)
                            .blur(radius: 15)

                        Text("\(question.option4)")
                            .foregroundColor(.white)
                            .font(.system(size: bounds.height * 0.045, weight: .bold, design: .default))
                            .multilineTextAlignment(.center)
                            .frame(width: bounds.size.width * 0.23, height: bounds.size.height * 0.23)
                        }.scaleEffect(isAsking ? 1.03 : 1.0)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), {
                                isAsking.toggle()
                            })
                        }
                    
                }
                .frame(width: bounds.width * 0.9, height: bounds.height * 0.35)

            }

            HStack{

                Spacer()



                ZStack {

                    
                    BlurView(style: .light)
                        .mask({
                            Rectangle()
                                .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.3)
                                .cornerRadius(20)
                        }).shadow(color: .init(white: 1, opacity: 0.5), radius: 50, x: 0, y: 0)
                    
                    
//                    Rectangle()
//                        .fill(wgGradient)
//                        .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.3)
//                            .cornerRadius(60)
//                            .opacity(0.9)
//                            .shadow(color: .black, radius: 20, x: 0, y: 35)
//
//                    Rectangle()
//                        .fill(wgGradient)
//                        .frame(width: bounds.size.width * 0.3, height: bounds.size.height * 0.3)
//                        .cornerRadius(60)
//                        .opacity(0.5)
//                        .blur(radius: 15)

                    Text("\(question.question)")
                        .foregroundColor(.white)
                        .font(.system(size: bounds.height * 0.045, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                        .frame(width: bounds.size.width * 0.25, height: bounds.size.height * 0.25)
                    }.scaleEffect(isAsking ? 1.07 : 1.0)
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), {
                            isAsking.toggle()
                        })
                    }


                Spacer()

            }

        }.onAppear(perform: {
            playSound(key: "Waiting")
        })
    }
}

struct QuestionViewtvOS_Previews: PreviewProvider {
    static var previews: some View {
        QuestionViewtvOS(viewNumber: .constant(Int(3)), userConnection: UserConnection(), question: Question(question: "Domanda", option1: "1", option2: "2", option3: "3", option4: "4"))
    }
}
