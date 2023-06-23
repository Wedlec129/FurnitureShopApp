//
//  HomeScreen.swift
//  FurnitureShopApp
//
//  Created by Борух Соколов on 22.06.2023.
//

import SwiftUI


struct HomeScreen: View {
    
    //эти штуки мы используем для категорий
    @State private var selectIndex: Int = 0
    private var categories = ["All","Chair","Sofa","Lamp","Kithen","Taible"]
    
    var body: some View {
        NavigationView {
            ZStack {
                //делаем задний фон и убираем сейв арену
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                //вся прога находится в вертикальном скроле
                ScrollView(.vertical,showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        //это верхние кнопки
                        AppBarView()
                        
                        //это текст про наше приложение
                        TagLineView()
                            .padding()
                        
                        //это показываем поисковую  строку и сканер
                        SearchAndScan()
                        
                        //показывает категории через цикл
                        //и всё это можно скролить горизонтально
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                //повторяем сколько категорий
                                ForEach(0 ..< categories.count,id: \.self) { i in
                                    
                                    //вызываем категорию
                                    CategoryView(isActive: i==selectIndex, text: categories[i])
                                    //обработка нажатия те актиной
                                        .onTapGesture {
                                            selectIndex=i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        
                        Text("Popular")
                        //задаём шрифт и размер текста
                            .font(.custom("PlayfairDisplay-Regular", size: 28))
                            .padding(.horizontal)
                        //сколл горизонтальный
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                //4 картинки
                                ForEach(1 ..< 5) { item in
                                    //это ссылки обработка нажатие
                                    //на картинку
                                    NavigationLink(destination: {
                                        DetailScrean()
                                        
                                    }, label:{
                                        //карты продуукта
                                        ProductCardView(image: Image("chair_\(item)"),size: 210)
                                            .padding(.trailing)
                                        
                                    })
                                    .navigationBarHidden(true)
                                    //убираем навиг бар
                                    
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
                
                //custom кнопки навиг бар
                HStack{
                    
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("fav 1")) {}
                    BottomNavBarItem(image: Image("shop 1")) {}
                    BottomNavBarItem(image: Image("User")) {}
                    
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule()) //как элепс обризаем
                .padding(.horizontal)
                //тень
                .shadow(color: Color.black.opacity(0.15), radius: 8,x: 2, y: 6)
                //размеры и положение бара(бара бара бебе бере ре :) )
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
            //кнопка и иконка меню
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color(.white)) //задний фон
                    .cornerRadius(10)   //закругдение
            }
            Spacer()//максимальный спейсинг
            Button(action: {}){
                Image("Profile")
                    .resizable()//ресайз картнки
                    .frame(width: 42,height: 42)//и подбираем размеры
                    .background(Color(.white))
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)//отспуп по горизонту
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
        //выбираем шрифт и размер текста
            .font(.custom("PlayfairDisplay-Regular", size: 28))
        //цвет текста
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScan: View {
    //переменная для поиска
    @State var search=""
    var body: some View {
        HStack{
            //картинка для поиска и строка
            HStack{
                Image("Search")
                TextField("Search Furnityre",text: $search)
                
            }
            .padding(.all,20)//отсуп и значение
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.trailing)
            
            //используем стстемную картинку
            Image(systemName: "barcode.viewfinder")
                .resizable()
                .frame(width: 30,height: 30)
                .padding()
                .background(Color("Primary"))
                .cornerRadius(10)
            
            
        }
        .padding(.horizontal) //горизонтальный отсуп
    }
}

//наши категории
struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            //ткуст
            Text(text)
                .fontWeight(.medium)
                .font(.system(size: 18))
            //цвет активной секции
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
    var image: Image //переменная картинки
    var size: CGFloat
    var body: some View {
        VStack{
            image //показываем картинку
                .resizable() //масштабируем её
                .frame(width: size,height: 200*(size/210)) //под нужный размер
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .foregroundColor(.black)
            //ставим звёзды
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
