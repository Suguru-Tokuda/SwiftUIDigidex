//
//  FromSwiftUIToUIKit.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI
import UIKit

struct FromSwiftUIToUIKit: View {
    var body: some View {
        Button {
            let storyboard =
            UIStoryboard(name: "Main",
            bundle: nil)
            let vc =
            storyboard.instantiateViewController(withIdentifier:
            "HiViewController")
            let nav = UINavigationController()
//            let vc = MyViewController()
            nav.pushViewController(vc, animated: true)
        } label: {
            Text("Go to UIKit")
        }

    }
}

#Preview {
    FromSwiftUIToUIKit()
}
