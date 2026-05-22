//
//  Content​View.swift
//  Weather
//
//  Created by Aysel Mohbaliyeva on 22.05.26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Hava Proqnozu")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack {
                    TextField("Şəhər adı yazın...", text: $viewModel.cityName)
                        .textFieldStyle(.roundedBorder)

                    Button("Axtar") {
                        Task {
                            await viewModel.searchWeather()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)

                if viewModel.isLoading {
                    ProgressView("Yüklənir...")
                }

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                }

                if let weather = viewModel.weather {
                    VStack(spacing: 12) {
                        Text(weather.name)
                            .font(.title)

                        Text("\(Int(weather.main.temp))°C")
                            .font(.system(size: 60, weight: .thin))

                        Text("Rütubət: \(weather.main.humidity)%")
                            .font(.title3)
                    }
                    .padding()
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                }

                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    ContentView()
}
