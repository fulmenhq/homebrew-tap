class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.5/goneat_v0.5.5_darwin_amd64.tar.gz"
      sha256 "9546e7f9c6d8babdb86c1ecf76bf3bdc8ff2e496055bd8700707343903ee2a79"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.5/goneat_v0.5.5_darwin_arm64.tar.gz"
      sha256 "0264926ed2f9004a4fb83e00352aecfe9c9009b706083cb5b4f131a504acadf3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.5/goneat_v0.5.5_linux_amd64.tar.gz"
      sha256 "c60c396f22abbc0657e73b4f48441214650f83eb038f4051b0415fd49bf77c13"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.5/goneat_v0.5.5_linux_arm64.tar.gz"
      sha256 "d4a3b0c040f5c22fda89956ef26513e3964cbd783cf935eb0c65bd264686d611"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
