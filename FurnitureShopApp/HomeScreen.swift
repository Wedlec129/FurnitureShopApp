//
//  HomeScreen.swift
//  FurnitureShopApp
//
//  Created by Борух Соколов on 22.06.2023.
//

import SwiftUI


struct HomeScreen: View {
    @State private var selectIndex: Int = 0
    private var categories = ["All","Chair","Sofa","Lamp","Kithen","Taible"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical,showsIndicators: false){
                    VStack(alignment: .leading){
                        AppBarView()
                        TagLineView()
                            .padding()
                        SearchAndScan()
                        //показывает категории через цикл
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                
                                ForEach(0 ..< categories.count,id: \.self) { i in
                                    CategoryView(isActive: i==selectIndex, text: categories[i])
                                        .onTapGesture {
                                            selectIndex=i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Regular", size: 28))
                            .padding(.horizontal)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(1 ..< 5) { item in
                                    NavigationLink(destination: {
                                        DetailScrean()
                                        
                                    }, label:{
                                        ProductCardView(image: Image("chair_\(item)"),size: 210)
                                            .navigationBarHidden(false)
                                            .padding(.trailing)
                                        
                                    })
                                    .navigationBarHidden(true)
                                    
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                        
                        Text("Beast")
                            .font(.custom("PlayfairDisplay-Regular", size: 28))
                            .padding(.horizontal)
                            .padding(.top)
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(1 ..< 5) { item in
                                    ProductCardView(image: Image("chair_\(item)"),size: 190)
                                        .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                        }
                        
                        
                    }
                }
                
                //custom Bottom navbar
                HStack{
                    
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("fav 1")) {}
                    BottomNavBarItem(image: Image("shop 1")) {}
                    BottomNavBarItem(image: Image("User")) {}
                    
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8,x: 2, y: 6)
                .frame(maxHeight: .infinity,alignment: .bottom)
                
                
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}






struct AppBarView: View {
    var body: some View {
        HStack{
            
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
            }
            Spacer()
            
            Button(action: {}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42,height: 42)
                    .background(Color(.white))
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScan: View {
    @State var search=""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                TextField("Search Furnityre",text: $search)
                
            }
            .padding(.all,20)
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.trailing)
            
            
            Image(systemName: "barcode.viewfinder")
                .resizable()
                .frame(width: 30,height: 30)
                .padding()
                .background(Color("Primary"))
                .cornerRadius(10)
            
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .fontWeight(.medium)
                .font(.system(size: 18))
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if(isActive){
                Color("Primary")
                    .frame(width: 22,height: 2)
                    .clipShape(Capsule())
                
            }
            
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    var image: Image
    var size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size,height: 200*(size/210))
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .foregroundColor(.black)
            HStack{
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$4599")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            
        }
        
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20.0)
        
        
        
    }
    
}

struct BottomNavBarItem: View {
    
    var image: Image
    var action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
