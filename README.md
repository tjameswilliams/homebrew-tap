# tjameswilliams/homebrew-tap

Homebrew formulae and casks for my projects.

## Formulae

```bash
brew install tjameswilliams/tap/ai-imessage
brew install tjameswilliams/tap/ai-icloud
```

## Casks

```bash
brew install --cask tjameswilliams/tap/opencodego
```

| Cask | What |
|---|---|
| `opencodego` | [Go for OpenCode](https://goforopencode.com) — the Mac companion that lets your iPhone drive the OpenCode coding agent. |

The companion keeps itself up to date via Sparkle, so its cask declares
`auto_updates true` and `brew upgrade` leaves it alone rather than fighting
the in-app updater.
