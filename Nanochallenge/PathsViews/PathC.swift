//
//  PathThree.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//

import SwiftUI

struct PathC: View {
    @Environment(\.dynamicTypeSize) var typeSize
    
    var dynamicPathC: String {
        switch typeSize {
            
        case ..<DynamicTypeSize.large:
            return "Os espinhos cresceram e sufocaram a minha plantinha!"
            
        case DynamicTypeSize.large ..< DynamicTypeSize.accessibility2:
            return "Sufocaram a minha plantinha!"
            
        default:
            return "Sufocou minha planta"
        }
    }
    
    var body : some View {
        ZStack{
            //Adicionando retangulo marrom
            VStack(alignment: .center, spacing: 10) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 146, maxHeight: 146)
                .background(Color(red: 0.73, green: 0.44, blue: 0.32))}
            .padding(0)
            .frame(height: 440, alignment: .bottom)
                    
                HStack (spacing: 8) {
                            Image("finalC")
                                .resizable()
                                .frame(width: 144, height: 144)
                                .offset(y:20) //mover 10px pra baixo
                                .accessibilityLabel("Muda de planta verde e murcha cercada de plantas pontiagudas marrons")
                        }//HStack
                
            //TEXTO E BOTÕES
            
            //Esconde o botão de voltar
            .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading, spacing: 12) {
                Text(dynamicPathC)
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .kerning(0.38)
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .bottom, spacing: 26) {
                    NavigationLink{
                        PathsView()
                    } label: {
                        Text("Tentar outro caminho")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal,8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.27, green: 0.39, blue: 0.37))
                            .cornerRadius(40)
                            .dynamicTypeSize(...DynamicTypeSize.accessibility4)
                    }
                    
                    NavigationLink{
                        FinalC()
                    } label: {
                        Text("O que isso significa?")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.27, green: 0.39, blue: 0.37))
                            .cornerRadius(40)
                            .dynamicTypeSize(...DynamicTypeSize.accessibility4)
                    }
                    NavigationLink{
                        HomeView()
                    } label: {
                        Text("Voltar ao início")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.27, green: 0.39, blue: 0.37))
                            .cornerRadius(40)
                    }
                } //HStack botões
                .padding(.horizontal, 0)
                .padding(.vertical, 7)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            } //VStack
            .padding(.horizontal, 80)
            .padding(.vertical, 64)
            .frame(width: 874, height: 402, alignment: .topLeading)
            
        } //ZStack
        
        //Cor de fundo
        .frame(width: 874, height: 402)
        .background(Color(red: 0.53, green: 0.8, blue: 0.91))
    }
}
