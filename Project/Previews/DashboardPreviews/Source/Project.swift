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
  ],
  dependencies: [
    .package(product: "Dashboard"),
  ])
