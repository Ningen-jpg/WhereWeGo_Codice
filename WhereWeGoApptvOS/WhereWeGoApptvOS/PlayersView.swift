//
//  ContentView.swift
//  ProvaInitialView
//
//  Created by fonztara on 06/07/22.
//

import SwiftUI

struct PlayersView: View {
    var bounds = UIScreen.main.bounds
    let mpcManager = MPCManager.shared
    @Binding var viewNumber: Int
    @State var users = false
    @State private var isConnecting = false
    
    @ObservedObject var userConnection: UserConnection
    //    @State var profiles: [Profile] = userConnection.profiles
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    let buttonGradient = LinearGradient(colors: [Color(red: 60/255, green: 255/255, blue: 80/255, opacity: 1), Color(red: 70/255, green: 80/255, blue: 255/255, opacity: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    var body: some View {
        
        ZStack {
            
            Text("Title")
            .onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if(userConnection.count > 0){
                        users = true
                    }
                }
            }
            
            PlayerView(video: "Mixato")
                .edgesIgnoringSafeArea(.all)
            
            
            ZStack {
                
                BlurView(style: .light)
                    .mask({
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width: bounds.width * 0.7, height: bounds.height * 0.8, alignment: .center)
                            
                        
                    })
                
//                Rectangle()
//                    .frame(width: bounds.width * 0.65, height: bounds.height * 0.8, alignment: .center)
//                                .cornerRadius(60)
                
                VStack(spacing: bounds.height * 0.02) {
                    
                    HStack(spacing: bounds.width * 0.04) {
                        
                            if(userConnection.count >= 1){
                                
                                VStack {
                                
                                Image(uiImage: userConnection.profiles[0].image)
                                    .resizable()
                                    .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    
                            
                                
                                    if(userConnection.profiles[0].name == "") {
                                        Text("Stefano")
                                            .foregroundColor(.black)
                                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                                    } else {
                                    
                            Text(userConnection.profiles[0].name)
                                .foregroundColor(.black)
                                .font(.system(size: bounds.height * 0.04, weight: .regular))
                                  
                                    }
                                    
                                }.scaleEffect(isConnecting ? 1.1 : 1.0)
                                .onAppear() {
                                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                            isConnecting.toggle()
                                        })
                                    }
                                
                            }
                            else{
                                
                                VStack(spacing: bounds.height * 0.05) {
                                Text("Open the iOS app to participate")
                                    .foregroundColor(.black)
                                    .font(.system(size: bounds.width * 0.04, weight: .semibold, design: .default))
                                    .frame(width: bounds.width * 0.35)
                                    .multilineTextAlignment(.center)
                            
                                  
                                    Image(systemName: "iphone")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.width * 0.09, weight: .semibold, design: .default))
                                        .scaleEffect(isConnecting ? 1.1 : 1.0)
                                        .onAppear() {
                                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                                    isConnecting.toggle()
                                                })
                                            }
                                
                                    
                                }.offset(x: 0, y: bounds.height * 0.05)
                                
                                
                                
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                            }
                        
                        
                        
                        if(userConnection.count >= 2){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[1].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[1].name == "") {
                                    Text("Alfonso")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[1].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        if(userConnection.count >= 3){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[2].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[2].name == "") {
                                    Text("Domenico")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[2].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        if(userConnection.count >= 4){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[3].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[3].name == "") {
                                    Text("Pierluca")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[3].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        
                    }.padding()
//                        .offset(x: 0, y: userConnection.count > 4 ? 0 : bounds.height * 0.1)
                    
                    
                    if(userConnection.count > 4) {
                    
                    
                    HStack(spacing: bounds.width * 0.05) {
                        
                        
                        if(userConnection.count >= 5){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[4].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[4].name == "") {
                                    Text("Francesco")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[4].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        if(userConnection.count >= 6){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[5].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[5].name == "") {
                                    Text("Leonardo")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[5].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        if(userConnection.count >= 7){
                            
                            VStack {
                            
                            Image(uiImage: userConnection.profiles[6].image)
                                .resizable()
                                .frame(width: bounds.width * 0.1, height: bounds.height * 0.16)
                                .scaledToFill()
                                .clipShape(Circle())
                                
                        
                            
                                if(userConnection.profiles[6].name == "") {
                                    Text("Alessandro")
                                        .foregroundColor(.black)
                                        .font(.system(size: bounds.height * 0.04, weight: .regular))
                                } else {
                                
                        Text(userConnection.profiles[6].name)
                            .foregroundColor(.black)
                            .font(.system(size: bounds.height * 0.04, weight: .regular))
                              
                                }
                                
                            }.scaleEffect(isConnecting ? 1.1 : 1.0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true), {
                                        isConnecting.toggle()
                                    })
                                }
                            
                        }
                        else{
//                                Image(systemName: "person.circle.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: bounds.width * 0.1))
                        }
                        
                        
                        
                        
                        
                    }.padding()
                    
                    } else {
                        
                    }
                    
                    //gray and off if no peer connected
                    
                    Spacer()
                    
                    
                }.offset(x: 0, y: bounds.height * 0.07)
                
                
                VStack {
                    
                    Spacer()
                    
                    Button(action: {
                        if(userConnection.count > 0){
                            
                            viewNumber = 100
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: bounds.width * 0.13, height: bounds.height * 0.085)
                                .foregroundColor(users ? .init(red: 0.04, green: 0.73, blue: 0.04, opacity: 1) : .init(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                        Text("Start")
                                .foregroundColor(users ? .white : .init(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
                            .font(.system(size: bounds.height * 0.06, weight: .semibold))
                        }
                    })
                    .disabled(!users)
                    .padding()
                        .buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                }.offset(x: 0, y: bounds.height * -0.09)
                
                
                
                
                
            }.onAppear(perform: {
                playSound(key: "Waiting")
            })
            .onDisappear(perform: {
                playSound(key: "ReadySetGo")
            })
            
           
            
            
            
            
        }
        
        
        
        
        
        
        
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayersView(viewNumber: .constant(Int(3)), userConnection: UserConnection())
        }

    }
}
