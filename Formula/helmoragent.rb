class Helmoragent < Formula
  desc "Agent watcher for AI-assisted product development"
  homepage "https://github.com/helmorx/helmoragent"
  url "https://github.com/helmorx/helmoragent/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "45e55c98cd4962430c80480d43cf2954c3aa73488ab9f43d4c16cf6b1da6f58d"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"helmor"), "./cmd/helmor"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/helmor version")
    assert_match "Usage: helmor", shell_output("#{bin}/helmor help")
  end
end
