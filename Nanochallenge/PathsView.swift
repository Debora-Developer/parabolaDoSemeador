//
//  PathsView.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//

import SwiftUI

struct PathsView: View {
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
            
            VStack{
                Text("Aonde a semente do semeador caiu?")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    
                Text("Escolha uma das opções para o semeador:")
                    .font(.headline)
                    .foregroundStyle(.white)
            // As sementes são botões
                HStack (spacing: 32) {
                    NavigationLink{
                        PathA()
                    } label: {
                        Image("seed1")
                            .resizable()
                            .frame(width: 160, height: 160)
                    }
                    NavigationLink{
                        PathB()
                    } label: {
                        Image("seed2")
                            .resizable()
                            .frame(width: 160, height: 160)
                    }
                    NavigationLink{
                        PathC()
                    } label: {
                        Image("seed3")
                            .resizable()
                            .frame(width: 160, height: 160)
                    }
                    NavigationLink{
                        PathD()
                    } label: {
                        Image("seed4")
                            .resizable()
                            .frame(width: 160, height: 160)
                    }
                } //HStack
                
                //Esconde o botão de voltar
                .navigationBarBackButtonHidden()
                
                // Textos como Botões
                HStack {
                    NavigationLink{
                        PathA()
                    } label: {
                        Text("a beira do caminho")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .cornerRadius(40)
                    }
                    NavigationLink{
                        PathB()
                    } label: {
                        Text("terreno pedregoso")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .cornerRadius(40)
                    }
                    NavigationLink{
                        PathC()
                    } label: {
                        Text("no meio dos espinhos")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .cornerRadius(40)
                    }
                    NavigationLink{
                        PathD()
                    } label: {
                        Text("em terra boa e fértil")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .cornerRadius(40)
                    }
                    
                } //HStack
            } //VStack
        } //ZStack
        
        //Cor de fundo
        .frame(width: 874, height: 402)
        .background(Color(red: 0.53, green: 0.8, blue: 0.91))
    }
}

#Preview {
    PathsView()
}
