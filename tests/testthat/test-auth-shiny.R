test_that("Shiny OAuth identifies users within the same organization", {
  skip_if_not_installed("shinyOAuth")
  provider <- oauth_provider_arcgis()
  select_id <- provider@userinfo_id_selector

  alice <- list(id = "organization-id", user = list(id = "alice-id"))
  bob <- list(id = "organization-id", user = list(id = "bob-id"))
  expect_identical(select_id(alice), "alice-id")
  expect_identical(select_id(bob), "bob-id")
  expect_null(select_id(list(id = "organization-id")))
  expect_null(select_id(list(id = "organization-id", user = list())))
})
