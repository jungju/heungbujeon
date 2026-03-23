# 흥부전

Roblox game project powered by Rojo.

## Structure

- `src/server` → `ServerScriptService/Server`
- `src/client` → `StarterPlayer/StarterPlayerScripts/Client`
- `src/shared` → `ReplicatedStorage/Shared`
- `src/workspace` → `Workspace/Map`

## Included starter setup

- `.gitignore`
- `aftman.toml`
- `wally.toml`
- 기본 라운드 루프 (`RoundService.server.luau`)
- 기본 HUD (`HUD.client.luau`)
- 공용 설정 (`GameConfig.luau`, `GameState.luau`)

## Run

```bash
rojo serve
```

Then connect from the Rojo plugin in Roblox Studio.
