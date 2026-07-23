class AiImessage < Formula
  desc "Local-first Apple Messages RAG index and MCP server"
  homepage "https://github.com/tjameswilliams/ai-imessage"
  url "https://github.com/tjameswilliams/ai-imessage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0cbd8f1901bfeea3371fabf8949d42163654a1f211d4c2594686be7cc1102574"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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

      After upgrades, if `ai-imessage service status` shows permission
      errors, re-toggle the Full Disk Access entry for the binary.
    EOS
  end

  test do
    assert_match "ai-imessage", shell_output("#{bin}/ai-imessage --version")
  end
end
