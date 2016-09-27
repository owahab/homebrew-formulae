class Gogub < Formula
  desc "The missing Github command-line"
  homepage "https://github.com/owahab/gogub"
  url "https://github.com/owahab/gogub.git",
    tag: "0.0.4"

  depends_on "go" => :build

  def install
    system "gobuild.sh"
    bin.install ".gobuild/bin/gub" => "gub"
  end

  test do
    system "#{bin}/gub", "--help"
  end
end
