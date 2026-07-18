require "language/node"

class Agenticos < Formula
  desc "AI-native project management MCP server for coding agents"
  homepage "https://github.com/madlouse/AgenticOS"
  url "https://github.com/madlouse/AgenticOS/releases/download/v0.5.0/agenticos-mcp-0.5.0.tgz"
  version "0.5.0"
  sha256 "8c3ddd3d8025bd7c905218ec1cd108a751bdd8de419b02fc11960cdd120c2311"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/agenticos-mcp --version")
  end
end
