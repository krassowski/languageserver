context("Test Hover")

test_that("Simple hover works", {
    skip_on_cran()
    client <- language_client()

    withr::local_tempfile(c("temp_file"), fileext = ".R")
    writeLines(
        c(
            "    strsplit",
            "fs::path_real"
        ),
        temp_file)

    client %>% did_save(temp_file)

    result <- client %>% respond_hover(temp_file, c(0, 7))
    expect_length(result$contents, 1)
    expect_true(stringr::str_detect(result$contents[1], "strsplit"))
    expect_equal(result$range$end$character, 12)

    result <- client %>% respond_hover(temp_file, c(1, 7))
    expect_length(result$contents, 1)
    expect_true(stringr::str_detect(result$contents[1], "path_real"))
    expect_equal(result$range$end$character, 13)
})

test_that("Hover on user function works", {
    skip_on_cran()
    client <- language_client()

    withr::local_tempfile(c("temp_file"), fileext = ".R")
    writeLines(
        c(
            "test1 <- function(x, y) x + 1",
            "test1"
        ),
        temp_file)

    client %>% did_save(temp_file)

    result <- client %>% respond_hover(temp_file, c(1, 3))
    expect_length(result$contents, 1)
    expect_equal(result$contents[1], "```r\ntest1(x, y)\n```")
    expect_equal(result$range$end$character, 5)
})
