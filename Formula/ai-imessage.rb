class AiImessage < Formula
  desc "Local-first Apple Messages RAG index and MCP server"
  homepage "https://github.com/tjameswilliams/ai-imessage"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  on_arm do
    # Signed (Developer ID) and notarized binary: fast installs, and the
    # Full Disk Access grant survives upgrades.
    url "https://github.com/tjameswilliams/ai-imessage/releases/download/v0.1.0/ai-imessage-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "2529095db67d86ac3f282b8b23f95cc82c820d7a7fbfacff6379e785265107bd"
  end

  on_intel do
    url "https://github.com/tjameswilliams/ai-imessage/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "0cbd8f1901bfeea3371fabf8949d42163654a1f211d4c2594686be7cc1102574"
    depends_on "rust" => :build
  end

  def install
    if Hardware::CPU.arm?
      bin.install "ai-imessage"
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  def caveats
    <<~EOS
      ai-imessage reads the Apple Messages database, which macOS protects
      with Full Disk Access. Two grants are needed over its lifetime:

        1. Your terminal app, for interactive use:  run `ai-imessage doctor`
        2. The binary itself, for the background sync agent:
           System Settings -> Privacy & Security -> Full Disk Access -> add
             #{opt_bin}/ai-imessage

      Quick start:
        ai-imessage doctor                    # check access
        ai-imessage etl                       # build the index (first run embeds; takes a while)
        ai-imessage service install --http    # keep it synced + serve MCP over HTTP (opt-in)
        ai-imessage connect                   # ready-to-paste MCP client JSON + token

      Guide: https://github.com/tjameswilliams/ai-imessage/blob/main/docs/recommended-path.md
    EOS
  end

  test do
    assert_match "ai-imessage", shell_output("#{bin}/ai-imessage --version")
  end
end
