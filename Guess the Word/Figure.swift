//
//  Figure.swift
//  Final Project
//
//  Created by Maverick Wadman on 5/12/24.
//

import SwiftUI

struct Figure: View {
    var body: some View {
        ZStack {
            staffBase()
            createHead()
            createBody()
            createRightArm()
            createLeftArm()
            createRightLeg()
            createLeftLeg()
            
        }
    }
    
    func staffBase() -> some View {
        ZStack {
            Rectangle()
                .frame(width: 10, height: 50)
                .offset(y: -85)
            Rectangle()
                .frame(width: 10, height: 100)
                .rotationEffect(Angle(degrees: 90))
                .offset(x: -50, y: -105)
            Rectangle()
                .frame(width: 10, height: 200)
                .offset(x: -100, y: -10)
            Rectangle()
                .frame(width: 10, height: 100)
                .offset(x: 90, y: 100)
                .rotationEffect(Angle(degrees: 90))
        }
    }
    
    func createHead() -> some View{
        Circle()
            .frame(width: 30, height: 30)
            .foregroundColor(.black)
            .offset(y: -50)
    }
    
    func createBody() -> some View{
        Rectangle()
            .frame(width: 10, height: 50)
            .foregroundColor(.black)
            .offset(y: -10)

    }
    
    func createRightArm() -> some View{
        Rectangle()
            .frame(width: 40, height: 10)
            .foregroundColor(.black)
            .offset(x: 5, y: -25)
            .rotationEffect(.degrees(30))
    }
    
    func createLeftArm() -> some View{
        Rectangle()
            .frame(width: 40, height: 10)
            .foregroundColor(.black)
            .offset(x: -5, y: -25)
            .rotationEffect(.degrees(330))
    }
    
    func createRightLeg() -> some View{
        Rectangle()
            .frame(width: 40, height: 10)
            .foregroundColor(.black)
            .offset(x: 25, y: 10)
            .rotationEffect(.degrees(45))
    }
    
    func createLeftLeg() -> some View{
        Rectangle()
            .frame(width: 40, height: 10)
            .foregroundColor(.black)
            .offset(x: -25, y: 10)
            .rotationEffect(.degrees(315))
    }
}

#Preview {
    Figure()
}
