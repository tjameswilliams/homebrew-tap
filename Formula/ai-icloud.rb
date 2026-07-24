class AiIcloud < Formula
  desc "Local-first iCloud Drive document RAG index and MCP server"
  homepage "https://github.com/tjameswilliams/ai-icloud"
  url "https://github.com/tjameswilliams/ai-icloud/releases/download/v0.1.3/ai-icloud-v0.1.3-aarch64-apple-darwin.tar.gz"
  sha256 "9518c766eb2b7a9cbe550c00669e8a953f8b858936e2d3db5a7eb660418d4d6f"
  version "0.1.3"
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
