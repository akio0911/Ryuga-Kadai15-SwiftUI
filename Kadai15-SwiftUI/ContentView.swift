//
//  ContentView.swift
//  Kadai15-SwiftUI
//
//  Created by Ryuga on 2023/04/09.
//

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool
}

struct ContentView: View {
    @State private var showingModal = false
    @State var fruits = [
        Fruit(name: "りんご", isChecked: false),
        Fruit(name: "みかん", isChecked: true),
        Fruit(name: "バナナ", isChecked: false),
        Fruit(name: "パイナップル", isChecked: true)
    ]

    var body: some View {
        NavigationStack{
            List {
                ForEach(fruits) { fruit in
                    ZStack {
                        HStack{
                            Image(systemName: fruit.isChecked ? "checkmark" : "")
                                .foregroundColor(Color.orange)
                            Spacer()
                        }
                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            if let check = self.fruits[fruit].isChecked as? Bool {
//                                            fruit.isChecked = !check
//                                        }
//                                    }
                        HStack {
                            Spacer().frame(width: 30)
                            Text(fruit.name)
                            Spacer()
                        }
                    }
                }
            }
            .toolbar { EditButton() }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingModal = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .fullScreenCover(isPresented: $showingModal) {
                        AddItemView(
                            didSave: { fruit in
                                fruits.append(fruit)
                                showingModal = false
                            },
                            didCancel: {
                                showingModal = false
                            }
                        )
                    }
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
