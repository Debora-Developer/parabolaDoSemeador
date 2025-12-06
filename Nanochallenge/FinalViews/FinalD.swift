//
//  FinalD.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//


import SwiftUI

struct FinalD: View {
    var body: some View {
        ZStack{
            //Adicionando retangulo marrom
            VStack(alignment: .center, spacing: 10) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 146, maxHeight: 146)
                .background(Color(red: 0.73, green: 0.44, blue: 0.32))}
            .padding(0)
            .frame(width: 874, height: 440, alignment: .bottom)
                    
                HStack (spacing: 32) {
                            Image("finalD")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .offset(y:8) //mover 10px pra baixo
                        }//HStack
            
            //TEXTO E BOTÕES
            //Esconde o botão de voltar
            .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Agora vou ter uma boa colheita! Estou muito feliz!")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .kerning(0.38)
                    .frame(width: 389, alignment: .topLeading)
                
                Text("Isso representa quando ouvimos a mensagem de Deus com um coração aberto, se esforça para compreendê-la e a coloca em prática. Como resultado, sua vida é transformada e ela produz frutos que impactando positivamente a si mesma e a todos ao seu redor.")
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .frame(width: 400, alignment: .topLeading)
                
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
    FinalD()
}
