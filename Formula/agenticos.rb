require "language/node"

class Agenticos < Formula
  desc "AI-native project management MCP server for coding agents"
  homepage "https://github.com/madlouse/AgenticOS"
  url "https://github.com/madlouse/AgenticOS/releases/download/v0.4.6/agenticos-mcp-0.4.6.tgz"
  version "0.4.6"
  sha256 "03bc177b4deee52288f817a7963093f419723517390bde568265c1f89fc8c42b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      AgenticOS has been installed via Homebrew.

      1. Set AGENTICOS_HOME (update from old /opt/homebrew/var/agenticos to your actual workspace):
           export AGENTICOS_HOME="#{var}/agenticos"

      2. Bootstrap:
           agenticos-bootstrap --workspace "#{var}/agenticos" --first-run

      3. Register with Claude Code:
           claude mcp add --transport stdio --scope user -e AGENTICOS_HOME="$AGENTICOS_HOME" agenticos -- agenticos-mcp

      4. Restart Claude Code and verify: claude mcp list
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agenticos-mcp --version")
  end
end
