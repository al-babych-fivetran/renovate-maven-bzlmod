#load("@bazel_tools//tools/jdk:remote_java_repository.bzl", "remote_java_repository") # cause error
load("@rules_java//toolchains:remote_java_repository.bzl", "remote_java_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def _toolchains_impl(_ctx):
    remote_java_repository(
        name = "zulu-linux_x64",
        prefix = "zulu_jdk",
        sha256 = "5317630424ee4e4d2c1024240d2e6f94a7c06d17b01dd36859df4a4d679fc287",
        strip_prefix = "zulu17.46.19-ca-jdk17.0.9-linux_x64",
        target_compatible_with = [
            "@platforms//cpu:x86_64",
            "@platforms//os:linux",
        ],
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu17.46.19-ca-jdk17.0.9-linux_x64.tar.gz",
            "https://artifact-cache.it-fivetran.com/repository/azul/zulu/bin/zulu17.46.19-ca-jdk17.0.9-linux_x64.tar.gz",
        ],
        version = "17",
    )

    # Zulu OpenJDK (x86 64-bit, macos)
    remote_java_repository(
        name = "zulu-macosx_x64",
        prefix = "zulu_jdk",
        sha256 = "19271b74c3f3b21f4978eda8f09908c063c456cea57265d71475ceefef5aa0ac",
        strip_prefix = "zulu17.46.19-ca-jdk17.0.9-macosx_x64",
        target_compatible_with = [
            "@platforms//cpu:x86_64",
            "@platforms//os:macos",
        ],
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu17.46.19-ca-jdk17.0.9-macosx_x64.tar.gz",
            "https://artifact-cache.it-fivetran.com/repository/azul/zulu/bin/zulu17.46.19-ca-jdk17.0.9-macosx_x64.tar.gz",
        ],
        version = "17",
    )

    # Zulu OpenJDK (ARM 64-bit, macos)
    remote_java_repository(
        name = "zulu-macosx_aarch64",
        prefix = "zulu_jdk",
        sha256 = "d6837676e55b97772b6512e253fdaf8ab282bb216c0f8366b6c5905cd02b5056",
        strip_prefix = "zulu17.46.19-ca-jdk17.0.9-macosx_aarch64",
        target_compatible_with = [
            "@platforms//cpu:aarch64",
            "@platforms//os:macos",
        ],
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu17.46.19-ca-jdk17.0.9-macosx_aarch64.tar.gz",
            "https://artifact-cache.it-fivetran.com/repository/azul/zulu/bin/zulu17.46.19-ca-jdk17.0.9-macosx_aarch64.tar.gz",
        ],
        version = "17",
    )

    # Zulu OpenJDK (ARM 64-bit, linux): for emulation of Engflow-like local machine with Apple Silicon (see https://github.com/fivetran/engineering/pull/112828)
    remote_java_repository(
        name = "zulu-linux_aarch64",
        prefix = "zulu_jdk",
        sha256 = "90062201e7911696a449431a61dc0a55cd10cda516a9f2db54c410633a79302a",
        strip_prefix = "zulu17.46.19-ca-jdk17.0.9-linux_aarch64",
        target_compatible_with = [
            "@platforms//cpu:arm64",
            "@platforms//os:linux",
        ],
        urls = [
            "https://cdn.azul.com/zulu/bin/zulu17.46.19-ca-jdk17.0.9-linux_aarch64.tar.gz",
            "https://artifact-cache.it-fivetran.com/repository/azul/zulu/bin/zulu17.46.19-ca-jdk17.0.9-linux_aarch64.tar.gz",
        ],
        version = "17",
    )

jdk_toolchain = module_extension(implementation = _toolchains_impl)
