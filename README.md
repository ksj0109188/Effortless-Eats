# Effortless-Eats
#### 내 주위 음식점을 무작위로 추천해 선택장애를 해결해주는 앱. KaKao API를 활용해 내 위치중심 정보 기반으로 설정한 거리에 따라 무작위 음식점 정보를 제공합니다.
<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/061c9eb5-8f2c-4a4c-983d-33bb86894877" width="200" alt="추천받기" />
<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/f20a37e5-60f4-4b66-88da-e5cba9bc34f9" width="200" alt="즐겨찾기" />
<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/94871d10-f72f-428a-ba68-cdc5b11ccd9c" width="200" alt="가게정보" />
<img src="https://github.com/ksj0109188/Effortless-Eats/assets/48472569/02e48b30-2d70-4d03-a8f5-459e6691c9f0" width="200" alt="설정" />

## Download
[<img src="https://img.shields.io/badge/apple-%23000000.svg?&style=for-the-badge&logo=apple&logoColor=white" />](https://apps.apple.com/kr/app/randomdine/id6477853120)
#### iPad:17.1, iOS:17.1이상 버전이여야 합니다.

## Funtions
- **추천받기**
  - 사용자 위치 기준으로 설정된 거리에 따라 랜덤하게 가게정보를 받아옵니다.
  - 사용 API는 **KaKao Local API**를 사용했습니다.

- **가게정보**
  - 추첨받은 가게를 연결해주는 기능으로, SafariWebView를 통해 KaKaoMap website로 이동시켜 사용자와 가게를 연결합니다.

- **즐겨찾기**
  - 추첨받은 가게를 간단하게 별 아이콘을 클릭해 즐겨찾기에 추가하고, 메인 화면에서 삭제 기능을 추가했습니다.

- **설정**
  - 검색에 사용될 거리를 설정하는 화면 및 위치 제공 동의 여부를 위한 설정이 존재합니다.

## Skills
- SwiftUI, Swift
- MVVM 
- Cobmine (KaKao API 호출및 에러 핸들링에 사용)
- KaKaoMap Local API (가게정보)
- Lint (코드 컨밴션)
- CoreData (즐겨찾기 정보 저장)


## File tree
```
sources
├─ RandomDine
│  ├─ Application
│  ├─ Data
│  │  ├─ DTO
│  │  ├─ Network
│  │  └─ Persistence
│  ├─ Extension
│  ├─ Presentation
│  │  ├─ Components
│  │  ├─ RecommendFoodStoreScene
│  │  │  ├─ View
│  │  │  └─ ViewModel
│  │  └─ SettingScene
│  ├─ Resource
│  └─ Utility
├─ ci_scripts
└─ .swiftlint.yml
```
