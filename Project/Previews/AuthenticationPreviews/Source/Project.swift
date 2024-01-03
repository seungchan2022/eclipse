import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "AuthenticationPreviews",
  packages: [
    .local(path: "../../../Feature/Authentication"),
    .local(path: "../../../Core/Architecture"),
    .local(path: "../../../Core/DesignSystem"),
    .local(path: "../../../Core/Domain"),
    .local(path: "../../../Core/Platform"),
  ] + .defaultItemList,
  dependencies: [
    .package(product: "Authentication"),
  ] + .defaultItemList,
  externalInfoPlist: [
    "CFBundleURLTypes": [
      [
        "CFBundleTypeRole": "Editor",
        "CFBundleURLSchemes": .array([
          "com.googleusercontent.apps.266313701700-e2cd32sgi6li4kkemjt9s907iff7k78a"
        ])
      ]
    ]
  ])
