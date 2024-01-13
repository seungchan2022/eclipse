import Architecture
import ComposableArchitecture
import SwiftUI
import DesignSystem

// MARK: - ProfilePage

struct ProfilePage {
  private let store: StoreOf<ProfileStore>
  @ObservedObject private var viewStore: ViewStoreOf<ProfileStore>
  
  init(store: StoreOf<ProfileStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
  
  @State private var selectedFilter: ProfileStore.ProfileGridFilter = .post
  @Namespace var animation
  
}

extension ProfilePage {
  private var gridItemList: [GridItem] {
    [
      .init(.flexible(), spacing: 1),
      .init(.flexible(), spacing: 1),
      .init(.flexible(), spacing: 1),
    ]
  }
  
  private var filterBarWidth: CGFloat {
    UIScreen.main.bounds.width / CGFloat(ProfileStore.ProfileGridFilter.allCases.count)
  }
}

// MARK: View

extension ProfilePage: View {
  
  @ViewBuilder
  var post: some View {
    ScrollView {
      LazyVGrid(columns: gridItemList, spacing: 1) {
        ForEach(0..<40) { index in
          Rectangle()
            .fill(.red)
            .scaledToFill()
        }
      }
    }
  }
  
  @ViewBuilder
  var reels: some View {
    Text("reels")
    Text("reels")
    Text("reels")
  }
  
  @ViewBuilder
  var tag: some View {
    ScrollView {
      VStack {
        ForEach(0..<10) { _ in
          Text("tag")
        }
      }
    }
  }
  
  var body: some View {
    VStack {
      DesignSystemNavigation(
        barItem: .init(
          actionItem: .init(title: "User Name", action: { }),
          moreActionList: [
            .init(title: "Plus", image: DesignSystemIcon.plus.image, action: { }),
            .init(title: "More", image: DesignSystemIcon.more.image, action: { })
          ]))
      {
        VStack(alignment: .leading) {
          HStack {
            Button(action: { }) {
              DesignSystemIcon.profile.image
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(DesignSystemColor.palette(.gray(.lv400)).color)
            }
            
            Spacer()
            
            HStack(spacing: 32) {
              
              Button(action: { }) {
                VStack {
                  Text("1")
                  Text("게시물")
                }
                .foregroundStyle(DesignSystemColor.system(.black).color)
              }
              
              Button(action: { }) {
                VStack {
                  Text("3")
                  Text("팔로워")
                }
                .foregroundStyle(DesignSystemColor.system(.black).color)
              }
              
              Button(action: { }) {
                VStack {
                  Text("10")
                  Text("팔로잉")
                }
                .foregroundStyle(DesignSystemColor.system(.black).color)
              }
            }
            
            Spacer()
          }
          .padding(.horizontal, 16)
          
          Text("User Name")
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          HStack {
            
            Button(action: { viewStore.send(.routeToEditor)  }) {
              HStack {
                Text("프로필 편집")
                  .font(.system(size: 14))
              }
              .frame(width: 130, height: 20)
              .foregroundStyle(DesignSystemColor.system(.black).color)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            
            
            Button(action: { }) {
              HStack {
                Text("프로필 공유")
                  .font(.system(size: 14))
              }
              .frame(width: 130, height: 20)
              .foregroundStyle(DesignSystemColor.system(.black).color)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            
            
            Button(action: { }) {
              HStack {
                DesignSystemIcon.find.image
                  .resizable()
                  .frame(width: 20, height: 20)
                
              }
              .frame(width: 20, height: 20)
              .foregroundStyle(DesignSystemColor.system(.black).color)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            
          }
          .padding(.leading, 16)
        }
        
        // Grid
        VStack(alignment: .leading) {
          HStack(spacing: .zero) {
            ForEach(ProfileStore.ProfileGridFilter.allCases) { filter in
              VStack {
                filter.image
                  .resizable()
                  .frame(width: 30, height: 30)
                  .foregroundStyle(
                    selectedFilter == filter
                    ? DesignSystemColor.system(.black).color : DesignSystemColor.palette(.gray(.lv300)).color)
                
                if selectedFilter == filter {
                  Rectangle()
                    .foregroundStyle(DesignSystemColor.system(.black).color)
                    .frame(width: filterBarWidth, height: 1)
                    .matchedGeometryEffect(id: "id", in: animation)
                } else {
                  Rectangle()
                    .foregroundStyle(DesignSystemColor.palette(.gray(.lv200)).color)
                    .frame(width: filterBarWidth, height: 1)
                }
              }
              .onTapGesture {
                withAnimation(.spring()) {
                  selectedFilter = filter
                }
              }
            }
          }
          
          switch selectedFilter {
          case .post:
            post
            
          case .reels:
            reels
          case .tag:
            tag
          }
        } // 그리드 뷰
        .padding(.top, 12)
        
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
  }
}


