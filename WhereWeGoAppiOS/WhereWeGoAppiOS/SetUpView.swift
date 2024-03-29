//
//  SetUpView.swift
//  WhereWeGoAppiOS
//
//  Created by Stefano Leva on 07/07/22.
//

import SwiftUI

struct SetUpView: View {
    let mpcManager = MPCManager.shared
    var bounds = UIScreen.main.bounds
    @State var connected = false
    @State var username: String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var selectedImage: UIImage?
    var imageData: Data? = nil
    @State private var isImagePickerDisplay = false
    @Binding var viewNumber: Int
    let nearBlack = Color(red: 0.1, green: 0.1, blue: 0.1, opacity: 1)
   
  
    
    
    var body: some View {
//            let bgGradient = LinearGradient(colors: [.green, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            let grayGradient = LinearGradient(colors: [.gray, nearBlack], startPoint: .topLeading, endPoint: .bottomTrailing)
            
        ZStack {
            
            Text("Title")
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        if(mpcManager.initialView){
                            connected = true
                        }
                }
            }
            
            BgView()
        
            VStack(spacing: bounds.height * 0.02){
                
                
                VStack{
                    
                    if selectedImage != nil {
                        Button(action: {
                            
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                            
                        }, label: {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(
                                    Circle()
                                )
                                .frame(width: bounds.width * 0.5, height: bounds.height * 0.25)
                                
                        }).buttonStyle(.plain)
//                        .onAppear(){
//                            imageData = selectedImage?.pngData()
//                        }
                            
                        
                        
                    } else {
//                        isImageSelected = true
                        Button(action: {
                            
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                            
                            
                        }, label: {
                            ZStack{
                                
                                Circle()
                                    .fill(grayGradient)
                                    .frame(width: bounds.width * 0.5, height: bounds.height * 0.25)
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: bounds.width * 0.3, height: bounds.height * 0.2)
                                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15, opacity: 1))
                                
                            }
    //                        .padding(.top, 40)
                        }).buttonStyle(.plain)
                        
                    }
                    
    //                Button("Camera") {
    //                    self.sourceType = .camera
    //                    self.isImagePickerDisplay.toggle()
    //                }
    //                .padding()
    //                .foregroundColor(.blue)
    //                .background(
    //                Rectangle()
    //                    .foregroundColor(Color( red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
    //                    .frame(width: bounds.width * 0.22, height: bounds.height * 0.05)
    //                    .cornerRadius(15)
    //                )
    //
    //                Button("Gallery") {
    //                    self.sourceType = .photoLibrary
    //                    self.isImagePickerDisplay.toggle()
    //                }
    //                .padding()
    //                .foregroundColor(.blue)
    //                .background(
    //                Rectangle()
    //                    .foregroundColor(Color( red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
    //                    .frame(width: bounds.width * 0.22, height: bounds.height * 0.05)
    //                    .cornerRadius(15)
    //                )
                }
                .navigationBarTitle("Demo")
                .sheet(isPresented: self.$isImagePickerDisplay) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                }
                
                VStack(spacing: bounds.height * 0.02) {
               
                TextField(
                        "Username",
                        text: $username
                ).textFieldStyle(.plain)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .frame(width: bounds.width * 0.5)
                    .font(.system(size: bounds.width * 0.08, weight: .regular))
                    .multilineTextAlignment(.center)
                    .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(white: 0.1, opacity: 0.8), lineWidth: 1.5)
                        )
//                    .padding()
                    .foregroundColor(.black)
                    
                    
                    
                    
                }
                
                
                Text("Edit your picture and username and connect to the TV")
                    .frame(width: bounds.width * 0.9, height: bounds.height * 0.1)
                    .multilineTextAlignment(.center)
                    .padding(.top, bounds.height * -0.03)
                    .foregroundColor(.init(white: 0.1))
                    .font(.system(size: bounds.width * 0.05))
                
                
                
                
                Button(action: {
                    if connected {
                        let profile = Profile(name: username, image: selectedImage?.pngData())
                        mpcManager.send(profile: profile)
                        self.viewNumber = 1
                    }
                        
                    
                    
                }, label: {
                    ZStack {
                        
                            Rectangle()
                            .foregroundColor(connected ? .white : Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
                            .frame(width: bounds.width * 0.3, height: bounds.height * 0.07)
                            .cornerRadius(bounds.width * 0.02)
                            .shadow(color: .init(white: 0, opacity: connected ? 0.4 : 0), radius: 22, x: 0, y: 10)
                            
                        
                            Text("Send")
                            .foregroundColor(connected ? .blue : Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
                            .font(.system(size: bounds.width * 0.08, weight: .bold))
                                                                        
                        
                    }
                    
                    
                }).padding(.top, bounds.height * 0.2)
                    .disabled(!connected)
                    .onAppear() {
                        mpcManager.startService()
                    }
                    .scaleEffect(connected ? 1.1 : 1.0)
                    .buttonStyle(.plain)
                    
                
                
                
//                Button(action: {
//                    if connected {
//                        let profile = Profile(name: username)
//                        mpcManager.send(profile: profile)
//                        self.viewNumber = 1
//                    }
//
//
//
//                }, label: {
//                    ZStack {
//                        if connected{
//                            Rectangle()
//                                .foregroundColor(.white)
//                                                                                                    .frame(width: bounds.width * 0.3, height: bounds.height * 0.07)
//                                                                                                    .cornerRadius(20)
//
//                            Text("Send")
//                                                                        .foregroundColor(.blue)
//                                                                        .font(.system(size: 30, weight: .bold))
//
//                        }
//                        else{
//                            Rectangle()
//                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
//                                                                                                    .frame(width: bounds.width * 0.3, height: bounds.height * 0.07)
//                                                                                                    .cornerRadius(20)
//
//                            Text("Send")
//                                .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
//                                .font(.system(size: bounds.width * 0.09, weight: .bold))
//
//
//                        }
//                    }
//
//
//                }).padding(.top, 100)
//                    .onAppear() {
//                        mpcManager.startService()
//                    }
                
//                Text("Edit your picture and username and connect to the TV")
//                    .frame(width: bounds.width * 0.9, height: bounds.height * 0.1)
//                    .multilineTextAlignment(.center)
//                    .padding(.top, bounds.height * -0.03)
//                    .foregroundColor(.black)
//                    .font(.system(size: bounds.width * 0.05))
            }
                
            
        }
        }
        
    }



struct SetUpView_Previews: PreviewProvider {
    static var previews: some View {
        SetUpView(viewNumber: .constant(Int(3)))
    }
}
