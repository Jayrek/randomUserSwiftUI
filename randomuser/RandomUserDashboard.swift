//
//  RandomUserDashboard.swift
//  randomuser
//
//  Created by Jayrek Tabasa on 12/1/24.
//

import SwiftUI

struct RandomUserDashboard: View {
    @ObservedObject private var viewModel = RandomUserListViewModel()
    @State private var shouldShowError: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if(viewModel.isLoading) {
                    ProgressView(StringConstants.kFetchingRandomUsers).font(.caption)
                }
                List(viewModel.users, id: \.email) { user in
                    HStack {
                        userImageView(picture: user.picture.large)
                        VStack(alignment: .leading) {
                            userFullNameView(name: user.name)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }.onTapGesture {
                            print(user.email)
                        }
                    }
                }
                .navigationTitle(StringConstants.navigationUserTitle)
                .alert(isPresented: $shouldShowError) {
                    Alert(
                        title: Text(StringConstants.kError),
                    message: Text(viewModel.errorDescription),
                        dismissButton: .default(Text(StringConstants.kOk)))
                }
            }
        }
        .task {
            await viewModel.getRandomUsers(result: StringConstants.kResultsMinCount)
            if !viewModel.errorDescription.isEmpty {
                shouldShowError = true
            }
        }
    }
}

func userImageView(picture: String) -> some View {
    return AsyncImage(url: URL(string: picture)) { image in
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    } placeholder: {
        Circle()
            .foregroundColor(.secondary)
    }
    .frame(width: 50, height: 50)
}

func userFullNameView(name: Name) -> some View {
    let fullName = "\(name.title) \(name.first) \(name.last)"
    return Text(fullName).font(.headline)
}

