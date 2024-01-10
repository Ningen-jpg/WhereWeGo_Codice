//
//  ExploreView.swift
//  WhereWeGoApptvOS
//
//  Created by fonztara on 19/07/22.
//

import SwiftUI

struct ExploreView: View {
    @Binding var isExploreViewDisplayed: Bool
    @State var isResultView2Displayed = false
    @ObservedObject var userConnection: UserConnection
    @State var destination = Destination(name: "Error", video: "Mixato")
    @Namespace var mainNamespace
    
    var bounds = UIScreen.main.bounds
    let cities = Cities.cities
    
    
    
    var body: some View {
        
        
        
        ZStack {
            
            PlayerView(video: "Mixato")
                .edgesIgnoringSafeArea(.all)
            BlurView(style: .light)
                .edgesIgnoringSafeArea(.all)
            

        
            VStack(spacing: 100) {
            
                VStack(spacing: -120) {
                    
                    Text("Explore")
                        .frame(width: bounds.width, alignment: .center)
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .shadow(color: .black, radius: 50, x: 0, y: 0)
                    
                    Button(action: {
                        isExploreViewDisplayed.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.black)
                            Text("X")
                                .foregroundColor(.white)
                                .font(.system(size: 70, weight: .medium, design: .rounded))
                        }
                        
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
                    .frame(width: bounds.width * 0.9, alignment: .trailing)
                }
               
                
        ScrollView {
            VStack(spacing: bounds.height * 0.06) {
                
                
            HStack(spacing: bounds.width * 0.16) {
                
                VStack(spacing: bounds.width * 0.01) {
                    Button(action: {
                        destination = Destination(name: "Ibiza", video: "Ibiza")
                        isResultView2Displayed.toggle()
                    }, label: {
                        
                        Image("IbizaPhoto")
                            .resizable()
                            .scaledToFill()
                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                        
                            
                        
                        
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
               Text("Ibiza")
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .semibold, design: .default))
            }
                
                
                VStack(spacing: bounds.width * 0.01) {
                    Button(action: {
                        destination = Destination(name: "Rio", video: "Rio")
                        isResultView2Displayed.toggle()
                    }, label: {
                        
                        Image("RioPhoto")
                            .resizable()
                            .scaledToFill()
                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                        
                        
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
               Text("Rio")
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .semibold, design: .default))
            }
                
                
                VStack(spacing: bounds.width * 0.01) {
                    Button(action: {
                        destination = Destination(name: "Zante", video: "Zante")
                        isResultView2Displayed.toggle()
                    }, label: {
                        
                        Image("ZantePhoto")
                            .resizable()
                            .scaledToFill()
                            .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                        
                        
                    }).buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle)
               Text("Zante")
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .semibold, design: .default))
            }
                
                
            }
                
                
                HStack(spacing: bounds.width * 0.16) {
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "Roccaraso", video: "Roccaraso")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("RoccarasoPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("Roccaraso")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "Courmayeur", video: "Courmayeur")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("CourmayeurPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("Courmayeur")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "Saint Moritz", video: "Saint Moritz")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("SaintMoritzPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("Saint Moritz")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                }
                
                
                HStack(spacing: bounds.width * 0.16) {
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "New York", video: "New York")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("NewYorkPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("New York")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "Tokyo", video: "Tokyo")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("TokyoPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("Tokyo")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                    VStack(spacing: bounds.width * 0.01) {
                        Button(action: {
                            destination = Destination(name: "Amsterdam", video: "Amsterdam")
                            isResultView2Displayed.toggle()
                        }, label: {
                            
                            Image("AmsterdamPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: bounds.width * 0.17, height: bounds.height * 0.2, alignment: .center)
                            
                            
                        }).buttonStyle(.plain)
                            .buttonBorderShape(.roundedRectangle)
                   Text("Amsterdam")
                            .foregroundColor(.black)
                            .font(.system(size: 60, weight: .semibold, design: .default))
                }
                    
                    
                }
                
                
                
            }
        }.prefersDefaultFocus(in: mainNamespace)
        }.focusScope(mainNamespace)
            
            
    }.sheet(isPresented: $isResultView2Displayed, content: {
        ResultView2(destination: $destination, isResultView2Displayed: $isResultView2Displayed, userConnection: userConnection)
    })

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(isExploreViewDisplayed: .constant(Bool(false)), userConnection: UserConnection())
    }
}
