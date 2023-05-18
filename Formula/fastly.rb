# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.1.0/fastly_v10.1.0_darwin-amd64.tar.gz"
      sha256 "821e4b46e5528b2494aa0bda8ad31d7bf9485a87a6983bd57ebea8ba573951fd"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v10.1.0/fastly_v10.1.0_darwin-arm64.tar.gz"
      sha256 "33433d76c73491ee69df35ec4c92b828fd6f0402f9a29ee42808fad7a1e3f4f7"

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
      url "https://github.com/fastly/cli/releases/download/v10.1.0/fastly_v10.1.0_linux-amd64.tar.gz"
      sha256 "b22147dad71fb0b5da6c9f4ae804ddd4f8a06e5834e84f5e60ebbf3ad0b4eca5"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v10.1.0/fastly_v10.1.0_linux-arm64.tar.gz"
      sha256 "aba8d94a39c2c4b61afe810845351ac78e2a17a68392b6858fe286c0646f5c07"

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
