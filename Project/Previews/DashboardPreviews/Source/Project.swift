import ProjectDescription
import ProjectDescriptionHelpers

let project: Project = .previewProject(
  projectName: "DashboardPreviews",
  packages: [
    .local(path: "../../../Feature/Dashboard"),
    .local(path: "../../../Core/Architecture"),
    .local(path: "../../../Core/DesignSystem"),
    .local(path: "../../../Core/Domain"),
    .local(path: "../../../Core/Platform"),
    .local(path: "../../../Core/Functor"),
  ] + .defaultItemList,
  dependencies: [
    .package(product: "Dashboard"),
  ] + .defaultItemList)
