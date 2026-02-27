//
//  FinalC.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//


import SwiftUI

struct FinalC: View {
    var body: some View {
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
                Spacer()
                    .frame(height: 20)
                
                Image("finalC")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .offset(x: 160, y:10) //mover 10px pra baixo
                    .accessibilityLabel("Muda de planta verde e murcha cercada de plantas pontiagudas marrons")
                
                Spacer()
                    .frame(height: 20)
            }
                
                
            //TEXTO E BOTÕES
            
            //Esconde o botão de voltar
            .navigationBarBackButtonHidden()
            
            ScrollView{
                VStack(alignment: .leading, spacing: 4) {
                    Text(dynamicPathC)
                        .font(.title.bold())
                        .foregroundStyle(.white)
                        .kerning(0.38)
                        .frame(alignment: .topLeading)
                    
                    Text("Isso representa quando ouvimos mas permitimos que as preocupações da vida e a busca por coisas passageiras tomem nosso tempo. A mensagem de Deus fica em segundo plano, e essas outras coisas acabam sufocando o crescimento espiritual.")
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                        .frame(width: 430, alignment: .topLeading)
                    
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
            }
            
        } //ZStack
        
        //Cor de fundo
        .frame(width: 874, height: 402)
        .background(Color(red: 0.53, green: 0.8, blue: 0.91))
    }
}
