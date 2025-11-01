class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.3/goneat_v0.3.3_darwin_amd64.tar.gz"
      sha256 "8c31b53b0689eedb40eb1c5c8685dc6d8613bd9fa096557252f97ee192cf16fc"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.3/goneat_v0.3.3_darwin_arm64.tar.gz"
      sha256 "6c66941e87a9f48d465b20213b1b1cd068c57e717d27607d08d0fa96907db173"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.3/goneat_v0.3.3_linux_amd64.tar.gz"
      sha256 "6c6150355106fe1e9d73e3c21d92a32a95a02088202a9941e5491be81ce0e142"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.3/goneat_v0.3.3_linux_arm64.tar.gz"
      sha256 "2a09b103abab67ae6c85f6b9691ad476f98f659c2a5fe5d294ec579b3cc45da1"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system "#{bin}/goneat", "--version"
  end
end
