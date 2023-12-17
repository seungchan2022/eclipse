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
  ] + .defaultItemList)
