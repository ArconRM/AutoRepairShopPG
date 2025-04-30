//
//  MechanicsView.swift
//  AutoRepairShopPG
//
//  Created by Artemiy MIROTVORTSEV on 26.04.2025.
//

import SwiftUI

struct MechanicsView: View {
    @ObservedObject var viewModel: MechanicsViewModel
    
    @State private var searchText: String = ""
    @State private var searchSpecialitySelected: MechanicSpeciality = .AutoMechanic
    @State private var searchType: SearchType = .mechanicId
    
    @State private var currentPage: Int = 0
    let itemsPerPage: Int = 1000
    
    enum SearchType: String, CaseIterable {
        case mechanicId = "ID механика"
        case phoneNumber = "Номер телефона"
        case speciality = "Специальность"
    }
    
    var body: some View {
        VStack {
            Picker("Искать по:", selection: $searchType) {
                ForEach(SearchType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: searchType) { _ in
                searchText = ""
                loadPage()
            }
            
            HStack {
                if searchType == .speciality {
                    Picker(selection: $searchSpecialitySelected) {
                        ForEach(MechanicSpeciality.allCases, id: \.self) { speciality in
                            Text(speciality.name)
                                .tag(speciality)
                                .font(.system(size: 15, weight: .bold))
                        }
                    } label: {}
                } else {
                    TextField("", text: $searchText, prompt: Text("Введите \(searchType.rawValue)"))
                        .onSubmit {
                            loadPage()
                        }
                }
                
                Button("Найти") {
                    loadPage()
                }
                .onChange(of: searchText) { newValue in
                    if newValue.isEmpty {
                        loadPage()
                        return
                    }
                    
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        searchText = filtered
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Table(viewModel.mechanics) {
                TableColumn("ID") { mechanic in
                    Text("\(mechanic.id)")
                }
                TableColumn("ФИО") { mechanic in
                    Text("\(mechanic.fullName)")
                }
                
                TableColumn("Номер телефона") { mechanic in
                    Text(mechanic.phoneNumber)
                }
                
                TableColumn("Специальность") { mechanic in
                    Text(mechanic.speciality.name)
                }
            }
            
            if searchText.isEmpty {
                HStack {
                    Button("Предыдущая") {
                        if currentPage > 0 {
                            currentPage -= 1
                            loadPage()
                        }
                    }
                    .disabled(currentPage == 0)
                    
                    Button("Следующая") {
                        currentPage += 1
                        loadPage()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            loadPage()
        }
    }
    
    private func loadPage() {
        let offset = currentPage * itemsPerPage
        
        if searchText.isEmpty && searchType != .speciality {
            viewModel.fetchAllMechanics(limit: itemsPerPage, offset: offset)
            return
        }
        
        switch searchType {
        case .mechanicId:
            viewModel.fetchMechanicById(mechanicId: Int(searchText) ?? -1)
        case .phoneNumber:
            viewModel.fetchMechanicByPhoneNumber(phoneNumber: "+\(searchText)")
        case .speciality:
            viewModel.fetchMechanicsBySpeciality(
                speciality: searchSpecialitySelected,
                limit: itemsPerPage,
                offset: offset
            )
        }
    }
}

#Preview {
    ViewFactory.shared.makeMechanicsView()
}
