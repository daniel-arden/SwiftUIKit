//
//  View+PersistentSystemOverlays.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-01.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /**
     This modifier will apply the `persistentSystemOverlays`
     modifier with a `.hidden` value, but only if the api is
     available. If not, the view will remain unchanged.
     */
    func prefersPersistentSystemOverlaysHidden() -> some View {
        #if os(iOS) && compiler(>=5.7)
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            return self.persistentSystemOverlays(.hidden)
        } else {
            return self
        }
        #else
        return self
        #endif
    }
}

struct View_PersistentSystemOverlays_Previews: PreviewProvider {

    static var previews: some View {
        Color.red
            .edgesIgnoringSafeArea(.all)
            .prefersPersistentSystemOverlaysHidden()
    }
}
