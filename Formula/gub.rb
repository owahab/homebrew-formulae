require "language/go"

class Gub < Formula
  desc "The missing Github command-line"
  homepage "https://github.com/owahab/gogub"
  url "https://github.com/owahab/gogub.git",
    tag: "0.0.4"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    # set up clearbit package
    (buildpath/"src/github.com/owahab/gogub").install Dir["*"]

    # set up dependencies
    resources = ["github.com/google/go-github/github"]
    Language::Go.stage_deps resources, buildpath/"src"

    # install clearbit command
    system(
      "go",
      "build",
      "-o", bin/"gub",
      "-v",
      "github.com/owahab/gogub",
    )
  end

  test do
    system "#{bin}/gub", "--help"
  end
end
