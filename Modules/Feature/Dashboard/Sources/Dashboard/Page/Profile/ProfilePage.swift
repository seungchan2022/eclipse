import Architecture
import ComposableArchitecture
import SwiftUI
import DesignSystem
import LinkNavigator

// MARK: - ProfilePage

struct ProfilePage {
  private let store: StoreOf<ProfileStore>
  @ObservedObject private var viewStore: ViewStoreOf<ProfileStore>
  
  @State private var isPlusBottomSheetPresented = false
  @State private var isMoreBottomSheetPresented = false
  
  
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
  
  @ViewBuilder
  var plusView: some View {
    VStack(spacing: .zero) {
      DesignSystemNavigation(
        barItem: .init(title: "만들기"))
      {
        Divider()
        
        VStack(alignment: .leading, spacing: 4) {
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.play.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("릴스")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.grid.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("게시물")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.story.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("스토리")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.highlight.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("스토리 하이라이트")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.live.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("라이브 방송")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 40)
          
          Button(action: { }) {
            HStack(spacing: 12) {
              DesignSystemIcon.customPlay.image
                .resizable()
                .scaledToFit()
                .frame(width: 24, alignment: .leading)
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
              Text("회원님을 위해 생성된 릴스")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
      }
    }
    .navigationTitle("")
    .navigationBarBackButtonHidden(true)
  }
  
  @ViewBuilder
  var moreView: some View {
    VStack(alignment: .leading, spacing: 4) {
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.play.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("릴스")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Divider()
        .padding(.leading, 40)
      
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.grid.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("게시물")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Divider()
        .padding(.leading, 40)
      
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.story.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("스토리")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Divider()
        .padding(.leading, 40)
      
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.highlight.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("스토리 하이라이트")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Divider()
        .padding(.leading, 40)
      
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.live.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("라이브 방송")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Divider()
        .padding(.leading, 40)
      
      Button(action: { }) {
        HStack(spacing: 12) {
          DesignSystemIcon.customPlay.image
            .resizable()
            .scaledToFit()
            .frame(width: 24, alignment: .leading)
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
          
          Text("회원님을 위해 생성된 릴스")
            .font(.system(size: 16))
            .foregroundStyle(DesignSystemColor.system(.black).color)
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
      }
      
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.top, 32)
    .frame(maxWidth: .infinity)
    .navigationTitle("")
    .navigationBarBackButtonHidden(true)
  }
  
  var body: some View {
    VStack {
      DesignSystemNavigation(
        barItem: .init(
          actionItem: .init(title: "User Name", action: { }),
          moreActionList: [
            .init(
              title: "Plus",
              image: DesignSystemIcon.plus.image,
              action: {
                //              viewStore.send(.onTapPlus)
                self.isPlusBottomSheetPresented = true
                print("On Tap navigation plus button")
                
              }),
            .init(
              title: "More",
              image: DesignSystemIcon.more.image,
              action: {
                self.isMoreBottomSheetPresented = true
              })
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
    .sheet(isPresented: $isPlusBottomSheetPresented) {
      plusView
        .padding(.top, 24)
        .scrollDisabled(true)
              .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(10)
    }
    .sheet(isPresented: $isMoreBottomSheetPresented) {
      moreView
        .presentationDetents([.fraction(0.7)])
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(10)
    }
  }
}

