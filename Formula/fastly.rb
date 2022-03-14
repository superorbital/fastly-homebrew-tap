# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "1.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v1.7.1/fastly_v1.7.1_darwin-amd64.tar.gz"
      sha256 "bb18b657746179a57223e2f0fb164a096a51f63da3cbed11e24efefe08672ea4"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v1.7.1/fastly_v1.7.1_darwin-arm64.tar.gz"
      sha256 "639d4b2e3cfad38fe5de95a240b105614e90a59cd75656bb1a951822891f68c6"

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
      url "https://github.com/fastly/cli/releases/download/v1.7.1/fastly_v1.7.1_linux-amd64.tar.gz"
      sha256 "4524f539bbba115845e0f4d26dff8f6025f173e7a38bdc30cabb14d4daeb9ca9"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v1.7.1/fastly_v1.7.1_linux-arm64.tar.gz"
      sha256 "09e3b123225b0c2d6e2b25b8506af391389f8272d8ed9a79c49674c84e0ef2d1"

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
