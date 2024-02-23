load("@rules_java//java:defs.bzl", "java_binary", "java_library", "java_test")
load("@bazel_jar_jar//:jar_jar.bzl", "jar_jar")


java_library(
    name = "target",
    srcs = ["target/Target.java"],
    deps = [
        "@maven//:org_clojure_core_specs_alpha",
        "@maven//:junit_junit"
    ]
)
java_binary(
    name = "shaded",
    main_class = "none",
    srcs = ["target/Target.java"],
    deps = [
        "@maven//:junit_junit"
    ]
)
jar_jar(
    name = "opensearch_shaded",
    input_jar = ":shaded_deploy.jar",
    rules = "shade_lucene",
    visibility = ["//visibility:public"],
)
# comment
java_library(
    name = "reference",
    srcs = ["reference/Reference.java"],
    deps = [":target"],
)

java_test(
    name = "target_test",
    srcs = ["target/TargetTest.java"],
    deps = [":target"],
    test_class = "example.TargetTest",
    env_inherit = ["TEST_ENV", "BUILDKITE_BRANCH"],
    env = {"TEST_ENV": "1"}, # comment this line, run "export TEST_ENV=1" and test to achieve same result
)
# test comment

java_test(
    name = "reference_test",
    srcs = ["reference/ReferenceTest.java"],
    deps = [":reference"],
    test_class = "example.ReferenceTest",
)

# test change1