class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.8/goneat_v0.5.8_darwin_amd64.tar.gz"
      sha256 "25b2946dc4c8403019ec66709844a31713801de46a4afe87a9a2efa40528df0e"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.8/goneat_v0.5.8_darwin_arm64.tar.gz"
      sha256 "1a00d53589f6231950129ac787768d5a451557912053b6c363c33cedff9004a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.8/goneat_v0.5.8_linux_amd64.tar.gz"
      sha256 "22b577482eeee63c0759f97b691758feff8eb02d1acc797f02cf287d914bd0ec"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.8/goneat_v0.5.8_linux_arm64.tar.gz"
      sha256 "362393b1e0d9c3e59c6ec02f9c824acf6bfb67149b39f867eda05120fa38f1c7"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
