//
//  File.swift
//  
//
//  Created by JLSANCHEZP on 11/8/24.
//

import SwiftUI

struct PTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .font(.custom("Roboto", size: 16))
                .fontWeight(.regular)
                .lineSpacing(4)
        } else {
            content
                .font(.custom("Roboto-Regular", size: 16)) // Usa la fuente con el peso ya definido
                .padding(.vertical, 2) // Añadir padding vertical para simular el line-height
        }
    }
}

extension Text {
    func pTextStyle() -> some View {
        self.modifier(PTextModifier())
    }
}
