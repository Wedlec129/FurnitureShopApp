//
//  DetailScrean.swift
//  FurnitureShopApp
//
//  Created by Борух Соколов on 23.06.2023.
//

import SwiftUI

struct DetailScrean: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            DetailScreanView()
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        CustomBackButtonView(action:{presentationMode.wrappedValue.dismiss()}),
                        trailing: Image("treeDot")
                )
                
        }

    }
}

struct DetailScrean_Previews: PreviewProvider {
    static var previews: some View {
        DetailScrean()
    }
}


struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Swedian chair")
                .font(.title)
                .fontWeight(.bold)
            HStack(spacing: 5){
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
                
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Diametr: 72 cm")
                        .opacity(0.6)
                    
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                    Text("Jati, Wood, Canvas \n Amazing Love")
                        .opacity(0.6)
                }
                
            }
            .padding(.top)
         
            HStack{
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color:.white)
                        ColorDotView(color:.black)
                        ColorDotView(color:Color("Primary"))
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack(spacing: 20){
                        
                        Button(action: {}, label:{
                            Image(systemName: "minus")
                                .padding(.all,8)
                        })
                        .frame(width: 30,height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                        
                        Button(action: {}, label:{
                            Image(systemName: "plus")
                                .padding(.all,8)
                        })
                        //.frame(width: 30,height: 30)
                        //.overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .background((Color("Primary")))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        
                    }
                }
                
            }
            
            .padding(.top)
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
        
        
        
        
        
    }
}

struct ColorDotView: View {
    let color:Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DetailScreanView: View {
    var body: some View {
        ZStack{
            
            Color("Bg")
                .ignoresSafeArea()
            
            ScrollView(.vertical,showsIndicators: true){
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                
                DescriptionView()
                    .offset(y:-40)
                
            }
            .edgesIgnoringSafeArea(.top)
            
            
            HStack{
                Text("$4599")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}, label: {
                    Text("add to card")
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                    
                })
                
            }
            
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50)
            .frame(maxHeight: .infinity,alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
            
            
        }
    }
}

struct CustomBackButtonView: View {
    let action: ()->Void
    var body: some View {
        Button(action: {action()}, label: {
            Image(systemName: "chevron.backward")
                .padding(.all,12)
                .background(Color(.white))
                .cornerRadius(8)
        })
    }
}
