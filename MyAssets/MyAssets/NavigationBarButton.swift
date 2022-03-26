//
//  NavigationBarButton.swift
//  MyAssets
//
//  Created by haeseongJung on 2022/03/26.
//

import SwiftUI

struct NavigationBarButton: ViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(action: {
                    print("자산 추가 버튼 tappend")
                }, label: {
                    Image(systemName: "plus")
                    Text("자산추가")
                        .font(.system(size: 12))
                    
                }
                                )
                .accentColor(.black)
                .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 13))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearnce = UINavigationBarAppearance()
                appearnce.configureWithTransparentBackground()
                appearnce.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance().standardAppearance = appearnce
                UINavigationBar.appearance().compactAppearance = appearnce
                UINavigationBar.appearance().scrollEdgeAppearance = appearnce
            }
    }
}

extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarButton(title: title))
    }
}

struct NavigationBarButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
        }
    }
}
