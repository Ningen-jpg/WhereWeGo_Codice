//
//  SwiftUIView.swift
//  ProvaInitialView
//
//  Created by fonztara on 10/07/22.
//

import SwiftUI

struct ResultView2: View {
    @Binding var destination: Destination
    @Binding var isResultView2Displayed: Bool
    @Namespace var mainNamespace
    @ObservedObject var userConnection: UserConnection
    @State private var isDetailsViewDisplayed = false
    
    
    var bounds = UIScreen.main.bounds
    
    let bgGradient = LinearGradient(colors: [.mint, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var myPreferredFocusedView: UIView?
    
    
    var body: some View {
        
        let detailsButton = Button(action: {
            self.isDetailsViewDisplayed.toggle()
        }, label: {
            ZStack {
                Rectangle()
                    .frame(width: bounds.width * 0.2, height: bounds.height * 0.15)
                    .foregroundColor(.init(red: 0.04, green: 0.73, blue: 0.04, opacity: 1))
            Text("Details")
                .foregroundColor(.white)
                .font(.system(size: bounds.height * 0.07, weight: .semibold))
            }
        }).buttonStyle(.plain)
            .buttonBorderShape(.roundedRectangle)
        .padding(.bottom)
        
        ZStack {
        
            PlayerView(video: destination.video)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: bounds.height * 0.65) {
                
                ZStack{
                    BlurView(style: .light)
                        .edgesIgnoringSafeArea(.all)
                        .mask( {
                            Rectangle()
                                .cornerRadius(15)
                                .frame(width: bounds.width * 1.1)
                            
                            }
                        )
                        
                   
                        
                    Text("\(destination.name)")
                        .font(.system(size: 100, weight: .semibold))
                    .foregroundColor((.init(white: 0.3)))
                }
                    
                
              
                HStack(spacing: bounds.width * 0.05) {
                    Spacer()
                    Button(action: {
                        userConnection.audio = false
                        isResultView2Displayed.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: bounds.width * 0.12, height: bounds.height * 0.15)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Image(systemName: "arrow.counterclockwise")
                                .font(.system(size: bounds.height * 0.075, weight: .bold))
                                .foregroundColor((.init(white: 0.3)))
                                
                        }
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom)
                    
                    
                    
                    detailsButton
                        .prefersDefaultFocus(in: mainNamespace)
                    
                    
                    Button(action: {}, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: bounds.width * 0.12, height: bounds.height * 0.15)
                                .foregroundColor(.init(red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                                
                        Text("Next")
                                .foregroundColor((.init(white: 0.3)))
                                .font(.system(size: bounds.height * 0.065, weight: .semibold))
                        }
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .padding(.bottom)
                    
                                
                                
                          Spacer()
                }.padding(.bottom)
                    .focusScope(mainNamespace)
                
            }
            
            
        }.sheet(isPresented: $isDetailsViewDisplayed, content: {
            DetailsView(isDetailsViewDisplayed: $isDetailsViewDisplayed)
        })
        .onAppear(perform: {
            if(!userConnection.audio){
                playSound(key: "Airplane")
                userConnection.audio = true
            }
        })
        
    }
}

//struct ResultViewView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView2(destination: Destination(name: "Destinazione", video: "Mixato"), isResultView2Displayed: .constant(Bool(false)), userConnection: UserConnection())
//    }
//}
