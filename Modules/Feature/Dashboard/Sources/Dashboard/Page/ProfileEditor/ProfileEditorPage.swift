import Architecture
import SwiftUI
import ComposableArchitecture
import DesignSystem

struct ProfileEditorPage {
  let store: StoreOf<ProfileEditorStore>
  @ObservedObject private var viewStore: ViewStoreOf<ProfileEditorStore>
  
  init(store: StoreOf<ProfileEditorStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension ProfileEditorPage { }

extension ProfileEditorPage: View {
  var body: some View {
    VStack {
      
      DesignSystemNavigation(
        barItem: .init(
          actionItem: .init(title: "취소", action: { viewStore.send(.routeToBack) }),
          title: "프로필 편집",
          moreActionList: [
            .init(title: "완료", action: { })
          ]))
      {
        Divider()
        
        // 사진 수정
        VStack {
          HStack (spacing: 24) {
            Spacer()
            
            Button(action: { }) {
              DesignSystemIcon.profile.image
                .resizable()
                .frame(width: 80, height: 80)
            }
            
            Button(action: { }) {
              DesignSystemIcon.avatar.image
                .resizable()
                .frame(width: 80, height: 80)
            }
            
            Spacer()
          }
          .foregroundStyle(DesignSystemColor.palette(.gray(.lv400)).color)
          
          Button(action: { }) {
            Text("사진 또는 아바타 수정")
          }
          .padding(.vertical, 8)
        }
        
        Divider()
        
        // Me 표현?
        VStack(alignment: .leading) {
          Button(action: { }) {
            HStack {
              Text("이름")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
                .frame(width: 80, alignment: .leading)
              
              Text("유저 이름")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 96)
                    
          Button(action: { }) {
            HStack {
              Text("사용자 이름")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
                .frame(width: 80, alignment: .leading)
              
              
              Text("사용자 이름")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
              
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 96)
          
          // 성별 대명사 ~ 링크는 없으면 기본 Placeholder로 표현 색상도 다르게 표현
          Button(action: { }) {
            HStack {
              Text("성별 대명사")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
                .frame(width: 80, alignment: .leading)
              
              
              Text("성별 대명사")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.palette(.gray(.lv250)).color)
              
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 96)
          
          Button(action: { }) {
            HStack {
              Text("소개")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
                .frame(width: 80, alignment: .leading)
              
              
              Text("소개")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.palette(.gray(.lv250)).color)
              
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }
          
          Divider()
            .padding(.leading, 96)
          
          Button(action: { }) {
            HStack {
              Text("링크")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.system(.black).color)
                .frame(width: 80, alignment: .leading)
              
              
              Text("Add links")
                .font(.system(size: 16))
                .foregroundStyle(DesignSystemColor.palette(.gray(.lv250)).color)
              
              
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
          }


        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        
        Divider()
        
        Button(action: { }) {
          Text("프로페셔널 계정으로 전환")
            .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .padding(.leading, 16)
        
        Divider()
        
        Button(action: { }) {
          Text("개인정보 설정")
            .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .padding(.leading, 16)
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
  }
}
