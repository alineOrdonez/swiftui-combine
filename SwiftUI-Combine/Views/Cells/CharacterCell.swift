//
//  CharacterCell.swift
//  SwiftUI-Combine
//
//  Created by Aline Ordoñez on 05/05/20.
//  Copyright © 2020 Aline Ordoñez. All rights reserved.
//

import SwiftUI

struct CharacterCell: View {
    
    let character: Character
    
    var body: some View {
        let thumbnail = character.thumbnail!
        let url = "\(thumbnail.path).\(thumbnail.imgExtension)"
        
        return VStack(alignment: .center) {
            Spacer()
            ImageView(url: url, placeholder: Text("Loading...")).aspectRatio(contentMode: .fit)
            Text(character.name).bold()
            Spacer(minLength: 10)
        }
    }
}

#if DEBUG
struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterCell(character: Character.getCharacter()).previewLayout(.sizeThatFits).environment(\.sizeCategory, .extraExtraLarge)
        }
    }
}
#endif
