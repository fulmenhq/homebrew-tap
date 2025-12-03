class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.11/goneat_v0.3.11_darwin_amd64.tar.gz"
      sha256 "e8237899102df8460c878cc5e90380ce9755940674af65404ae3e4aa72c7680f"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.11/goneat_v0.3.11_darwin_arm64.tar.gz"
      sha256 "1bc77736e1b89f8d7a6e6d2195b1088936cd2aaeee3917dbfec42673fead4000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.11/goneat_v0.3.11_linux_amd64.tar.gz"
      sha256 "58b6bbdd1175e414cf349bfe99911587b270abc26b17b83386da534e0be39b93"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.11/goneat_v0.3.11_linux_arm64.tar.gz"
      sha256 "5258009465b0b39d3f2855002fc54c74b5ed7e4b8882b01d08ae8c16991939b8"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
