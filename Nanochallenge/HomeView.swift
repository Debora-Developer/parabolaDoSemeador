//
//  HomeView.swift
//  Nanochallenge
//
//  Created by Débora Costa on 30/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            //plano de fundo
            Image("BackgroundHome")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            //Imagem Semeador
            HStack(alignment: .bottom, spacing: 10){
                Spacer()
                Image("seeder")
                    .resizable()
                    .frame(width: 255, height: 352)
            }
            //Posição Imagem Semeador
            .padding(.horizontal, 36)
            .offset(y:10) //mover 10px pra baixo
//            .frame(width: 852, height: 402,
//                   alignment: .bottomTrailing)
            
            VStack(spacing: 50){
                Image("Logotipo")
                    .resizable()
                    .frame(maxWidth: 395, maxHeight: 173)
//                    .frame(width: 395, height: 173, alignment: .center)
                
                //Esconde o botão de voltar
                    .navigationBarBackButtonHidden()
                
                //Link para passar para a próxima tela
                NavigationLink{
                    //tela de destino
                    GameSceneView()
                    //botão com destino
                } label: {
                    //características do botão
                    Text("Iniciar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 64)
                        .padding(.vertical, 8)
                        .background(Color(red: 0.27, green: 0.39, blue: 0.37))
                        .cornerRadius(40)
                }
            }
        }
        //Cor de fundo
//        .frame(width: 874, height: 402)
        .background(Color(red: 0.53, green: 0.8, blue: 0.91))
        }
    }
#Preview {
    HomeView()
}
