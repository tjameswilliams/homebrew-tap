class AiIcloud < Formula
  desc "Local-first iCloud Drive document RAG index and MCP server"
  homepage "https://github.com/tjameswilliams/ai-icloud"
  url "https://github.com/tjameswilliams/ai-icloud/releases/download/v0.1.1/ai-icloud-v0.1.1-aarch64-apple-darwin.tar.gz"
  sha256 "c67005d74bf6862bc5e5c0c627d2eb33b5829ec3b4018b40d28203e6f1dacd75"
  version "0.1.1"
  license "MIT OR Apache-2.0"

  depends_on "ffmpeg"

  def install
    bin.install "ai-icloud"
  end

  def caveats
    <<~EOS
      Start with the interactive wizard:
        ai-icloud setup
      It walks through your OpenAI-compatible LLM backend (any provider
      works; LM Studio is the macOS happy path), privacy exclusions,
      and transcription, then:
        ai-icloud scan
        ai-icloud service install
        ai-icloud connect   # MCP JSON for any agent framework
      If the background daemon logs permission errors, grant Full Disk
      Access to #{HOMEBREW_PREFIX}/bin/ai-icloud in System Settings.
    EOS
  end

  test do
    system bin/"ai-icloud", "--version"
  end
end
