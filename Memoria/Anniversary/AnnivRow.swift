//
//  AnnivRow.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/07/09.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import SwiftUI

struct AnnivRow : View {
    
    var anniversary: Anniversary
    
    var anniversaryCategory: AnniversaryCategory {
        anniversary is Anniv ? .anniv : .birthday
    }
    
    var title: String {
        switch anniversary {
        case let anniv as Anniv:
            return anniv.title
        case let birthday as Birthday:
            return NameManager.getFullName(isFamilyNameFirst: true,
                                           familyName: birthday.familyName,
                                           givenName: birthday.givenName)
        default: fatalError("存在しない記念日型")
        }
    }

    var body: some View {
        HStack {
            AnnivUtil.configureImage(imageData: anniversary.iconImage, annivCategory: anniversaryCategory)
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()

            Text(title)
                .foregroundColor(.primary)
            Spacer()
            
            if anniversary.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct AnnivRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            AnnivRow(anniversary: sampleAnnivs[0])
            AnnivRow(anniversary: sampleAnnivs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }

}
#endif
