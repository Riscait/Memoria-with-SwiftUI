//
//  AnnivRow.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/07/09.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import SwiftUI

struct AnnivRow : View {
    var anniv: Anniv
    
    var body: some View {
        HStack {
            AnnivUtil.configureImage(imageData: anniv.iconImage, annivCategory: anniv.category)
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()

            Text(anniv.category.name)
                .color(.primary)
            Spacer()
            
            if anniv.isFeatured {
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
            AnnivRow(anniv: annivs[0])
            AnnivRow(anniv: annivs[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }

}
#endif
