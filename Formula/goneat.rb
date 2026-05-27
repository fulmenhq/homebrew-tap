class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.12/goneat_v0.5.12_darwin_amd64.tar.gz"
      sha256 "93ca1c3d19f16d36b1224234f604d0d84b08e8b60650981431a487ad8e50a811"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.12/goneat_v0.5.12_darwin_arm64.tar.gz"
      sha256 "4409b2ca1e5ba13cb05b0b4aaac191e16536ba81f6b0c060faf418be74d2ae54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.12/goneat_v0.5.12_linux_amd64.tar.gz"
      sha256 "dc66305f05c638edc288a56fc57404b4b7d3bd069a1af68bdb7c8bf1b74ed134"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.12/goneat_v0.5.12_linux_arm64.tar.gz"
      sha256 "0ff1a9861949ea37c6f4ef13f9373f18ddde583eaf164fae9efb27af0b56b92d"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
