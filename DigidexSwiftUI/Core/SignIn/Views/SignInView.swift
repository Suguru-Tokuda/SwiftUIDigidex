//
//  SignInView.swift
//  DigidexSwiftUI
//
//  Created by Suguru Tokuda on 11/6/23.
//

import SwiftUI

struct SignInView: View {
    @StateObject var vm = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Degidex SwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                    Spacer()
                    VStack(spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(.callout)
                                .fontWeight(.bold)
                                .padding(.leading, 5)
                            TextField("", text: $vm.email)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 12)
                                .background(Color.theme.secondaryBackground.cornerRadius(25))
                                .foregroundStyle(.black)
                                .font(.headline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Password")
                                .font(.callout)
                                .fontWeight(.bold)
                                .padding(.leading, 5)

                            SecureField("", text: $vm.password)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 12)
                                .background(Color.theme.secondaryBackground.cornerRadius(25))
                                .foregroundStyle(.black)
                                .font(.headline)
                        }

                    }
                    Spacer()
                    Spacer()
                    NavigationLink {
                        DigimonTabView()
                    } label: {
                        ZStack {
                            Text("Login")
                                .foregroundStyle(.white)
                                .font(.headline)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(minHeight: 50)
                                .frame(maxHeight: 50)
                                .zIndex(1.0)
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .zIndex(0.9)
                                .frame(maxHeight: 50)
                        }

                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    SignInView()
}
