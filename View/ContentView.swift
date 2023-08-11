//
//  ContentView.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var employeeViewModel = EmployeeViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(employeeViewModel.employees) { item in
                    NavigationLink {
                        Text((item.full_name)!)
                    } label: {
                        EmployeeCell(employee: item)
                            .accessibilityIdentifier("Item_\(item.uuid!.uuidString)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .accessibilityIdentifier("EmployeesListView")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .accessibilityIdentifier("Tool_add_button")
                }
            }
            Text("Select an item")
        }
        .onAppear(perform: employeeViewModel.fetchEmployees)
        .refreshable{employeeViewModel.fetchEmployees()}
    }

    private func addItem() {
        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
//                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
