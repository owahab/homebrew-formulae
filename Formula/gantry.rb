class Gantry < Formula
  desc "The last package you will need to install"
  homepage "docker-gantry.github.io"
  url "https://github.com/docker-gantry/gantry/releases/download/0.5.0/gantry_0.5.0_osx_64-bit.tar.gz"
  version "0.5.0"
  sha256 "7753171635896b21903f1fb10d4bc26b56313d5d38a7ffda39502877bd7f5887"

  depends_on "git"

  def install
    bin.install "gantry"
  end

  test do
    system "#{bin}/gantry --version"
  end
end
