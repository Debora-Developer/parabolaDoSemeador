//
//  FinalB.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//


import SwiftUI

struct FinalB: View {
    var body : some View {
        ZStack{
            //Ilustração
            //Adicionando imagem raio
            Image("Raio")
                .resizable()
                .frame(width: 874, height: 389)
                .offset(y: -20)
            
            //Adicionando retangulo marrom
            VStack(alignment: .center, spacing: 10) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 146, maxHeight: 146)
                .background(Color(red: 0.73, green: 0.44, blue: 0.32))}
            .padding(0)
            .frame(width: 874, height: 440, alignment: .bottom)
            
            //Adicionando final
                HStack (spacing: 32) {
                            Image("")
                                .resizable()
                                .frame(width: 160, height: 160)
                            Image("finalB")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .offset(x:50 ,y:20)
                            Image("")
                                .resizable()
                                .frame(width: 160, height: 160)
                            Image("")
                                .resizable()
                                .frame(width: 160, height: 160)
                        }//HStack
            
            //TEXTO E BOTÕES
            //Esconde o botão de voltar
            .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Ops... ela queimou no sol porque não tinha raiz")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .kerning(0.38)
                    .frame(width: 400, alignment: .topLeading)
                
                Text("Isso representa quando fazemos um compromisso sem profundidade. Assim que surge a dificuldade, deixamos a mensagem de Deus pois nossa base não está sólida.")
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .frame(width: 300, alignment: .topLeading)
                
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
    FinalB()
}
