context("defaults")

test_that("autoloads",{
  disable_autoload()
  expect_false(autoload_line %in% readLines(get_r_profile()))
  expect_false(is_autoload())
  enable_autoload()
  expect_true(autoload_line %in% readLines(get_r_profile()))
  expect_true(is_autoload())
  disable_autoload()
  expect_false(autoload_line %in% readLines(get_r_profile()))
  expect_false(is_autoload())
  enable_autoload()
  write(autoload_line_old, file = get_r_profile(), append = TRUE)
  expect_true(is_autoload())
  disable_autoload()
  expect_false(autoload_line %in% readLines(get_r_profile()))
  expect_false(autoload_line_old %in% readLines(get_r_profile()))
  expect_false(is_autoload())
})

test_that("overrides", {
  disable_rdocs()
  expect_false(rdocs_active())
  enable_rdocs()
  expect_true(rdocs_active())
  disable_rdocs()
  expect_false(rdocs_active())
})

disable_autoload()
disable_rdocs()