//
//  InsertFormView.swift
//  SayahatAI
//
//  Created by Beket Barlykov  on 13.06.2023.
//

import SwiftUI

struct DropDownItem: Identifiable{
    let id: Int
    let title: String
    let onSelect: () -> Void
}

struct InsertFormView: View {
    @State var destinationText: String = ""
    var dropDownList: [DropDownItem] = [
        DropDownItem(id: 1, title: "1 Day", onSelect: {}),
        DropDownItem(id: 2, title: "2 Days", onSelect: {}),
        DropDownItem(id: 3, title: "3 Days", onSelect: {}),
        DropDownItem(id: 4, title: "4 Days", onSelect: {}),
        DropDownItem(id: 5, title: "5 Days", onSelect: {}),
        DropDownItem(id: 6, title: "6 Days", onSelect: {}),
        DropDownItem(id: 7, title: "7 Days", onSelect: {}),
    ]
    @State var selectedNumDays: Int = 1
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .background(.gray)
            
            HStack{
                Image(systemName: "flag")
                    .frame(width: 20, height: 20)
                TextField("Your Destinations e.g. city, region", text: $destinationText)
                    .textFieldStyle(.plain)
                    .frame(maxWidth: .infinity)
                Image(systemName: "calendar")
                    .frame(width: 20, height: 20)
                DropDownTextFieldView(selectedNumDays: $selectedNumDays, dropDownList: dropDownList)
                
            }.padding(.top, 10)

        }.frame(maxWidth: .infinity, maxHeight: 300)
    }
}

struct InsertFormView_Previews: PreviewProvider {
    static var previews: some View {
        InsertFormView()
    }
}

struct DropDownTextFieldView: View{
    @Binding var selectedNumDays: Int
    @State var isSelecting: Bool = false
    @State var selectionTitle = "1 Day"
    var dropDownList: [DropDownItem]
    
    var body: some View{
        VStack{
            HStack{
                Text(selectionTitle)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                Spacer()
                Image(systemName:"chevron.down")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            
            if isSelecting {
                Divider()
                    .background(.white)
                    .padding(.horizontal)
                
                VStack(spacing: 5){
                    ForEach(dropDownList){
                        item in
                        DropDownItemView(isSelecting: $isSelecting,
                                         selectionTitle: $selectionTitle,
                                         item: item
                        )
                        
                    }
                }
                
            }

        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color(uiColor: UIColor.lightGray))
        .cornerRadius(5)
        .onTapGesture{
            isSelecting.toggle()
        }
        }
    
    
    
    struct DropDownItemView: View{
        @Binding var isSelecting: Bool
        @Binding var selectionTitle: String
        let item: DropDownItem
        var body: some View{
            Button(action: {
                isSelecting = false
                selectionTitle = item.title
                item.onSelect()
            }){
                Text(item.title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
    }
}
