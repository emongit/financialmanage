//
//  ContentView.swift
//  test
//
//  Created by 堀江奈央 on 2022/07/12.
//

import SwiftUI

struct FirstPage: View {
    let items = ["任天堂", "ソニー", "トヨタ", "ユニクロ"]

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ..< items.count) { index in
                    NavigationLink(destination: DetailView()) {
                        Text(items[index])
                    }
                }
            }.navigationBarTitle("")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct DetailView: View {
    @State var selectedIndex = 0

    var body: some View {
        
        Text("企業名")
        
        Picker("", selection: $selectedIndex) {
            Text("BS")
                .tag(0)
            Text("PL")
                .tag(1)
            Text("CF")
                .tag(2)
        }.pickerStyle(SegmentedPickerStyle())
        
        Spacer()
    }
}

struct ContentView: View {

    var body: some View {
        TabView{
            FirstPage()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
            Text("検索")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
            Text("お気に入り")
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
            Text("設定")
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("設定")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
