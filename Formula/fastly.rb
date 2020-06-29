# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.15.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.15.0/fastly_v0.15.0_darwin-amd64.tar.gz"
    sha256 "9f234c98468e9240066f650a3c62f11789852949c9a00cab2f10b4d5142bc6b5"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.15.0/fastly_v0.15.0_linux-amd64.tar.gz"
      sha256 "6812ecfca75feb63668ce29d22be37247dd70ef280e3b0fe3b0cf8bc5658c752"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v0.15.0/fastly_v0.15.0_linux-arm64.tar.gz"
        sha256 "208bb0db8ef9f889b32bb291f6ccc0b398cba4ae016ce6c69ba132de171ef486"
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
