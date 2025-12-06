//
//  ajudaDeus.swift
//  Nanochallenge
//
//  Created by Débora Costa on 03/08/25.
//

import SwiftUI

struct PathA: View {
    var body: some View {
        ZStack{
            //Ilustração do fundo
            //Adicionando retangulo marrom
            VStack(alignment: .center, spacing: 10) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 146, maxHeight: 146)
                .background(Color(red: 0.73, green: 0.44, blue: 0.32))}
            .padding(0)
            .frame(width: 874, height: 440, alignment: .bottom)
            
            //Adicionando imagem pássaro
            Image("bird 1")
                .resizable()
                .frame(width: 874, height: 389)
                .offset(y: 30)
            
            //Adicionando final
            HStack (spacing: 8) {
                        Image("finalA")
                            .resizable()
                            .frame(width: 160, height: 160)
                            .offset(y: 10)
                    }//HStack
            
            //TEXTO E BOTÕES
            //Esconde o botão de voltar
            .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Oh não! A ave levou para comer!")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .kerning(0.38)
                    .frame(width: 344, alignment: .topLeading)
                
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
                    }
                    
                    NavigationLink{
                        FinalA()
                    } label: {
                        Text("O que isso significa?")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.27, green: 0.39, blue: 0.37))
                            .cornerRadius(40)
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
        

#Preview {
   PathA()
        }
