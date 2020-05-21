# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.9.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.9.0/fastly_v0.9.0_darwin-amd64.tar.gz"
    sha256 "8ab82ba330c56a3e3067945b5f5da8c5a18ae6927f0eabeac54ea815f9bacd36"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.9.0/fastly_v0.9.0_linux-amd64.tar.gz"
      sha256 "1d09a9afb5122939ec18a66bdb5a2500734a07e6087c43c8718050da253d3800"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v0.9.0/fastly_v0.9.0_linux-arm64.tar.gz"
        sha256 "1eba3fb814360345f83361dda20623924e83c369e2c836c7f40342122c4c7a3a"
      else
      end
    end
  end
  
  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  def install
    system "make" if build.head?
    bin.install "fastly"
    (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
    (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
