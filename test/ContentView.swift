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

struct SecondPage: View {
    
        let items : [String] = ["任天堂", "ソニー", "トヨタ", "ユニクロ","A株式会社", "Bカンパニー", "C.com", "DDD","E社","eee","Eカンパニー","eスポーツ協会","ee-ne!!"]
            
        @State var isEditing = false
        @State var searchText = ""
        
        var filterdItems: [String] {
                if searchText.isEmpty {
                    return items
                } else {
                    return items.filter {$0.uppercased().contains(searchText.uppercased())}
                }
            }
        var body: some View {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                    })
                    if isEditing {
                        Button(action: {
                            self.searchText = ""
                        }){
                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .padding()
                
                List {
                    ForEach(filterdItems, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
}

struct ThirdPage: View {
        @State private var items = ["任天堂", "ソニー", "トヨタ", "ユニクロ"]
     
        var body: some View {
            NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: rowRemove)
                .onMove(perform: rowReplace)
            }
            .navigationBarTitle("")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
            }
        }

        func rowRemove(offsets: IndexSet) {
            items.remove(atOffsets: offsets)
        }
    
        func rowReplace(_ from: IndexSet, _ to: Int) {
            items.move(fromOffsets: from, toOffset: to)
        }
}

//struct FourthPage: View {
//
//}

struct DetailView: View {
    @State var selectedIndex = 0

    var body: some View {
        
        Text("企業名（企業コード）")
        
        Picker("", selection: $selectedIndex) {
            Text("BS")
                .tag(0)
            Text("PL")
                .tag(1)
            Text("CF")
                .tag(2)
        }.pickerStyle(SegmentedPickerStyle())
        Text("ここにシートを表示")
        
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
            SecondPage()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
            ThirdPage()
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
            Text("メモ")
                .tabItem {
                Image(systemName: "square.and.pencil")
                   Text("メモ")
                }
//            FourthPage()
//                .tabItem {
//                    Image(systemName: "square.and.pencil")
//                    Text("メモ")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
