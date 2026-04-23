require "language/node"

class Agenticos < Formula
  desc "AI-native project management MCP server for coding agents"
  homepage "https://github.com/madlouse/AgenticOS"
  url "https://github.com/madlouse/AgenticOS/releases/download/v0.4.8/agenticos-mcp-0.4.8.tgz"
  version "0.4.8"
  sha256 "b9e2e9a46f7d544ae5371c814d551cd15e864ebbb4a551e6e496d4164f16aa00"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      AgenticOS has been installed via Homebrew.

      1. Set AGENTICOS_HOME:
           export AGENTICOS_HOME="/Users/jeking/dev/AgenticOS"

      2. Bootstrap:
           agenticos-bootstrap --workspace "#{ENV["HOME"]}/dev/AgenticOS" --first-run

      3. Register with Claude Code:
           claude mcp add --transport stdio --scope user -e AGENTICOS_HOME="$AGENTICOS_HOME" agenticos -- agenticos-mcp

      4. Restart Claude Code and verify: claude mcp list
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenticos-mcp --version")
  end
end
