# Upstream

| | |
| --- | --- |
| Project | XBOW validation benchmarks |
| Repository | https://github.com/xbow-engineering/validation-benchmarks |
| Benchmark | `benchmarks/XBEN-071-24` (SQL make mistakes) |
| Version | main (the repository has no releases) |
| Commit | a16cb1ba0701b20d63913846536fc7b0672082af |
| Licence | Apache-2.0 (LICENSE and NOTICE at the repository root, copied here) |

| Here | validation-benchmarks path |
| --- | --- |
| `build/db/app/` | [`benchmarks/XBEN-071-24`](https://github.com/xbow-engineering/validation-benchmarks/tree/a16cb1ba0701b20d63913846536fc7b0672082af/benchmarks/XBEN-071-24) |

The vendored folder is that commit's benchmark folder, unchanged, without its Git history, canary
strings included. The flag is the one upstream's Makefile builds with (`common.mk`: `FLAG{` + the
SHA-256 of `XBEN-071-24` + `}`), passed there as the `FLAG` build argument; Isoloom builds without build
arguments, so the overlay `build/db/Dockerfile` (the benchmark's `mysql/Dockerfile`, its COPY sources
pointed into `app/`) makes that value the argument's default.

The other machines:

- `app`: built by the benchmark's own Dockerfile in `build/db/app/app`, as is.

To update, replace the vendored folder with a newer commit's benchmark folder, then change this file.
