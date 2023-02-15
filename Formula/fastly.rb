# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "6.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v6.0.6/fastly_v6.0.6_darwin-arm64.tar.gz"
      sha256 "236e5f7f1866b9d63dfcf5e8a1e64ca38b6332e3faaf0f773dd4393214a199ab"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v6.0.6/fastly_v6.0.6_darwin-amd64.tar.gz"
      sha256 "7225691a6ad292e41978e42b4a02165782742758b82c17f23bfe74047b7a8340"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v6.0.6/fastly_v6.0.6_linux-amd64.tar.gz"
      sha256 "f0da5dcb63ba7d1798fe0bebfbf99b221158ef64035e9e82d5a3f83a0e652cd7"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v6.0.6/fastly_v6.0.6_linux-arm64.tar.gz"
      sha256 "37dece094e99294cca6ffede8bca41ba8dd2f3521e8f0ddea1498f323d8b229c"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
