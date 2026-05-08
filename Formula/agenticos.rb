require "language/node"

class Agenticos < Formula
  desc "AI-native project management MCP server for coding agents"
  homepage "https://github.com/madlouse/AgenticOS"
  url "https://github.com/madlouse/AgenticOS/releases/download/v0.4.15/agenticos-mcp-0.4.15.tgz"
  sha256 "a47c8513d95b4f5bbfbdb1bb2d32e26592a917e648194e3a15ee1ca908c8e1f6"
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
           agenticos-bootstrap --workspace "#{Dir.home}/dev/AgenticOS" --first-run

      3. Register with Claude Code:
           claude mcp add --transport stdio --scope user -e AGENTICOS_HOME="$AGENTICOS_HOME" agenticos -- agenticos-mcp

      4. Restart Claude Code and verify: claude mcp list
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenticos-mcp --version")
  end
end
