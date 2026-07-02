class Helmoragent < Formula
  desc "Agent watcher for AI-assisted product development"
  homepage "https://github.com/helmorx/helmoragent"
  url "https://github.com/helmorx/helmoragent/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "fd7cef598f237ae04ef54c6f7178049d002ab28b0d9c1992ebf785a5217f0b13"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"helmor"), "./cmd/helmor"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/helmor version")
    assert_match "Usage: helmor", shell_output("#{bin}/helmor help")
  end
end
