class AiIcloud < Formula
  desc "Local-first iCloud Drive document RAG index and MCP server"
  homepage "https://github.com/tjameswilliams/ai-icloud"
  url "https://github.com/tjameswilliams/ai-icloud/releases/download/v0.1.0/ai-icloud-v0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "d24741d7ba83f3fb8bb65f191b655b56751af9f96b4fd2736cd9c0eab148e53f"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  def install
    bin.install "ai-icloud"
  end

  def caveats
    <<~EOS
      Start with the interactive wizard:
        ai-icloud setup
      It walks through the OpenAI-compatible LLM backend (LM Studio is
      the happy path), privacy exclusions, and transcription, then:
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
