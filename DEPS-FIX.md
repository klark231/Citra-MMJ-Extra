# 依赖修复说明（DEPS-FIX）

## 这份源码为什么编不了

`weihuoya/citra`（Citra-MMJ）是真源码，但它的 `.gitmodules` 指向 **4 个已经不存在的仓库** ——
它们都在 `citra-emu` 组织下，而该组织的仓库在 **2024 年 3 月随 Citra 整体下架时被一起删除**。

## 已经改了什么

`.gitmodules` 里 6 个 URL 换成了活着的地址（原件备份为 `.gitmodules.orig`）：

| 原地址 | 换成 | 状态 |
|---|---|---|
| `citra-emu/ext-boost` | `boostorg/boost` | 仓库在，**但钉死的 commit 不在** |
| `citra-emu/ext-soundtouch` | `azahar-emu/soundtouch` | 同上 |
| `citra-emu/dynarmic-android` | `azahar-emu/dynarmic` | 同上 ← **JIT 核心，最关键** |
| `citra-emu/ext-libressl-portable` | `libressl/portable` | 同上 |
| `philsquared/Catch` | `catchorg/Catch2` | 改名，**钉死的 commit 仍在** ✔ |
| `discordapp/discord-rpc` | `discord/discord-rpc` | 改名，**钉死的 commit 仍在** ✔ |

## ★ 关键结论：光换 URL 不够（有实测证据）

我逐个查了"钉死的 commit 在替代仓库里存不存在"：

```
ext-boost          @36603a1e665e → boostorg/boost        ✘ 不存在
ext-soundtouch     @060181eaf273 → azahar-emu/soundtouch ✘ 不存在
dynarmic-android   @b6be02ea7fae → azahar-emu/dynarmic   ✘ 不存在
ext-libressl       @7d01cb01cb1a → libressl/portable     ✘ 不存在
Catch              @15cf3caaceb2 → catchorg/Catch2       ✔ 存在
discord-rpc        @3d3ae7129d17 → discord/discord-rpc   ✔ 存在
```

**换成新 URL 后 `git submodule update` 依然会失败** —— 因为父仓库索引里钉的是
那个已经消失的 commit。要真的拉下来，必须**把 pin 升到替代仓库里真实存在的版本**。

## 但这会引出代码适配问题

| 依赖 | 升版本的后果 |
|---|---|
| `dynarmic`（JIT） | Citra 那份是**自己 fork 的 Android 版**，接口与上游不同 ⇒ 调用处要改 |
| `Catch` → Catch2 | **v1 → v2 是破坏性 API 变更**，`src/tests` 整个要适配 |
| `boost` | 版本跨度大，部分头文件/API 已移除 |
| `libressl` / `soundtouch` | 接口可能有小改 |

⇒ **这是"逐依赖升版本 + 改代码 + 反复编译试错"的活，按天算。**

## 建议的做法（研究用）

**别跟 submodule 较劲，直接把依赖当普通目录 vendor 进来**。ZIP 版本来就没有 git 索引，
所以 submodule 机制对这份源码本来就没用。用附带的 `fetch-deps.sh`：

```bash
bash fetch-deps.sh          # 把 16 个依赖 clone 进 externals/ 对应位置
```

它会用 `--depth 1` 拉各仓库的默认分支（读代码够用）。
**要真编译**，再按上表逐个把版本调到与代码兼容的那一版。

## 备注

- 本目录来自 `https://codeload.github.com/weihuoya/citra/zip/refs/heads/master`
  （注意：`github.com/.../archive/...zip` 那个常见地址在国内会超时，**codeload 才是通的**）
- 本目录**不含** `externals/` 下的依赖内容（ZIP 固有行为），需要跑 `fetch-deps.sh`
