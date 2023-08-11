//
//  EmployeeCell.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import SwiftUI
import Combine

struct EmployeeCell: View {
    @State var employee: Employee?
    var body: some View {
        HStack{
            WebImageView(urlString: (employee?.smallPhoto ?? URL(string: ""))!)
                .accessibilityIdentifier("WebImageView")
            VStack(alignment: .leading, spacing: 0){
                Text(employee?.full_name ?? "")
                    .font(.system(size: 20))
                    .accessibilityIdentifier("Text_fullname")
                Text(employee?.biography ?? "")
                    .frame(maxHeight: 80)
                    .font(.system(size: 14))
                    .accessibilityIdentifier("Text_biography")
                HStack{
                    Text(employee?.phone_number ?? "")
                        .font(.system(size: 12))
                        .accessibilityIdentifier("Text_phone_number")
                    Text(employee?.team ?? "")
                        .font(.system(size: 12))
                        .accessibilityIdentifier("Text_team")
                }
            }
            .padding(.leading, 12)
            .accessibilityIdentifier("VStack")
        }
        .accessibilityIdentifier("HStack")
    }
}
struct EmployeeCell_PreViews: PreviewProvider {
    static var previews: some View {
        EmployeeCell()
    }
}
