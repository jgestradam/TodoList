//
//  ListView.swift
//  TodoList
//
//  Created by Joseph Estrada on 11/18/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                listItems
            }
        }
        .navigationTitle("Todo List 📝 ")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

extension ListView {
    private var listItems: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())

    }
}
