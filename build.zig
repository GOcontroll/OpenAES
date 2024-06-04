const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const lib = b.addStaticLibrary(.{
        .name = "oaes",
        .target = target,
        .version = .{ .major = 0, .minor = 10, .patch = 0 },
        .optimize = .ReleaseSmall,
        .link_libc = true,
        .strip = true,
    });

    const exe = b.addExecutable(.{
        .name = "oaes",
        .target = target,
        .version = .{ .major = 0, .minor = 10, .patch = 0 },
        .optimize = .ReleaseSmall,
        .link_libc = true,
        .strip = true,
    });

    lib.addCSourceFiles(.{
        .files = &.{
            "src/oaes_lib.c",
            "src/oaes_base64.c",
            "src/isaac/rand.c",
        },
    });

    exe.addCSourceFiles(.{
        .files = &.{
            "src/oaes.c",
        },
    });

    lib.addIncludePath(.{ .cwd_relative = "src/isaac" });
    lib.addIncludePath(.{ .cwd_relative = "inc" });
    exe.addIncludePath(.{ .cwd_relative = "inc" });
    exe.linkLibrary(lib);
    b.installArtifact(lib);
    b.installArtifact(exe);
}
