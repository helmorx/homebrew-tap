class Helmoragent < Formula
  desc "Agent watcher for AI-assisted product development"
  homepage "https://github.com/helmorx/agent-os"
  url "https://github.com/helmorx/agent-os/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "15bf36627580860518a0bb476c4fb6c9b43e0c5b09b8716744eff1b52964d2cb"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"helmor"), "./cmd/helmor"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/helmor version")
    assert_match "HELMOR Agent OS", shell_output("#{bin}/helmor help")
  end
end
