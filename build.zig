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
    lib.installHeader(.{ .cwd_relative = "inc/oaes_lib.h" }, "oeas_lib.h");
    lib.installHeader(.{ .cwd_relative = "inc/oaes_config.h" }, "oaes_config.h");
    lib.installHeader(.{ .cwd_relative = "inc/oaes_common.h" }, "oaes_common.h");
    lib.installHeader(.{ .cwd_relative = "inc/oaes_base64.h" }, "oaes_base64.h");

    exe.addIncludePath(.{ .cwd_relative = "inc" });
    exe.linkLibrary(lib);

    b.installArtifact(lib);
    b.installArtifact(exe);
}
