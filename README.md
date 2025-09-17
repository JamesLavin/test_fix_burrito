# TestVixBurrito

This is a vanilla Phoenix app with [vix](https://github.com/akash-akya/vix) and [burrito](https://github.com/burrito-elixir/).

I created this repo to debug why [vix](https://github.com/akash-akya/vix) compilation using [burrito](https://github.com/burrito-elixir/) fails.

To replicate, install Elixir, install Zig 0.15.1, and download this repo.

Then run:

```
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
```

You should then see something like:
```
--> Going to recompile NIF for cross-build: vix -> x86_64-linux
Cleaning build artifacts...
pipe.c:3:10: fatal error: 'glib-object.h' file not found
    3 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
In file included from utils.c:1:
./utils.h:5:10: fatal error: 'glib-object.h' file not found
    5 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
In file included from vips_boxed.c:2:
./g_object/g_boxed.h:5:10: fatal error: 'glib-object.h' file not found
    5 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
vips_foreign.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
vips_image.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
vips_interpolate.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
vips_operation.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
vix.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
g_object/g_boxed.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
g_object/g_object.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
g_object/g_param_spec.c:2:10: fatal error: 'glib-object.h' file not found
    2 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
g_object/g_type.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
g_object/g_value.c:1:10: fatal error: 'glib-object.h' file not found
    1 | #include <glib-object.h>
      |          ^~~~~~~~~~~~~~~
1 error generated.
Setting up precompiled libvips...

09:54:14.410 [debug] Fetching https://github.com/akash-akya/sharp-libvips/releases/download/v1.2.0/sharp-libvips-linux-x64.tar.gz

09:54:15.866 [debug] Extracting to /tmp/burrito_build_49DA478AA112C338/lib/vix-0.35.0/priv/sharp-libvips-linux-x64.tar.gz
 CC     pipe.c
 CC     utils.c
 CC     vips_boxed.c
 CC     vips_foreign.c
 CC     vips_image.c
 CC     vips_interpolate.c
 CC     vips_operation.c
 CC     vix.c
 CC     g_boxed.c
 CC     g_object.c
 CC     g_param_spec.c
 CC     g_type.c
 CC     g_value.c
 LD     vix.so
ld.lld: error: unable to find library -l:libvips.so.42
make[1]: *** [Makefile:158: /tmp/burrito_build_49DA478AA112C338/lib/vix-0.35.0/priv/vix.so] Error 1
make: *** [Makefile:9: compile] Error 2
--> Failed to rebuild vix for x86_64-linux!
** (exit) 1
    (burrito 1.4.0) lib/steps/patch/recompile_nifs.ex:133: Burrito.Steps.Patch.RecompileNIFs.maybe_recompile_nif/8
    (elixir 1.18.4) lib/enum.ex:987: Enum."-each/2-lists^foreach/1-0-"/2
    (burrito 1.4.0) lib/steps/patch/recompile_nifs.ex:23: Burrito.Steps.Patch.RecompileNIFs.execute/1
    (burrito 1.4.0) lib/builder/builder.ex:140: anonymous fn/3 in Burrito.Builder.run_phase/2
    (elixir 1.18.4) lib/enum.ex:2546: Enum."-reduce/3-lists^foldl/2-0-"/3
    (elixir 1.18.4) lib/enum.ex:987: Enum."-each/2-lists^foreach/1-0-"/2
    (burrito 1.4.0) lib/builder/builder.ex:88: Burrito.Builder.build/1
    (mix 1.18.4) lib/mix/tasks/release.ex:1079: Mix.Tasks.Release.run_steps/1
```